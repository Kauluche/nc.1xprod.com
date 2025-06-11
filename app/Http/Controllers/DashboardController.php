<?php

namespace App\Http\Controllers;

use App\Models\Pharmacy;
use App\Models\Order;
use App\Models\ContactSubmission;
use App\Models\User;
use App\Models\Zone;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\Models\Document;
use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        $data = [];

        if ($user->isAdmin()) {
            // Récupérer les notifications de suppression de pharmacie non lues
            $pharmacyDeletionRequests = $user->notifications()
                ->where('type', 'pharmacy_deletion_request')
                ->whereNull('read_at')
                ->latest()
                ->get();

            $data = [
                'total_pharmacies' => Pharmacy::count(),
                'total_orders' => Order::count(),
                'total_documents' => Document::count(),
                'recent_orders' => Order::with(['pharmacy', 'items'])->latest()->take(5)->get(),
                'recent_documents' => Document::latest()->take(5)->get(),
                'pharmacy_deletion_requests' => $pharmacyDeletionRequests,
            ];
        } elseif ($user->isCommercial()) {
            // Récupérer les pharmacies du commercial
            $pharmacies = $user->pharmacies();
            
            // Statistiques des pharmacies
            $totalPharmacies = $pharmacies->count();
            $clientPharmacies = $pharmacies->where('status', 'client')->count();
            $prospectPharmacies = $totalPharmacies - $clientPharmacies;
            
            // Statistiques des commandes avec les totaux calculés correctement
            $pharmacyIds = $pharmacies->pluck('id')->toArray();
            
            $orders = Order::whereIn('pharmacy_id', $pharmacyIds);
            $totalOrders = $orders->count();
            
            // Calculer le total des commandes en incluant les items
            $totalOrdersAmount = Order::whereIn('pharmacy_id', $pharmacyIds)
                ->join('order_items', 'orders.id', '=', 'order_items.order_id')
                ->select(DB::raw('SUM(order_items.quantity * order_items.unit_price * (1 - order_items.discount_percentage / 100)) as total_amount'))
                ->first()
                ->total_amount ?? 0;
            
            // Statistiques mensuelles
            $currentMonth = Carbon::now()->month;
            $monthlyOrders = $orders->whereMonth('created_at', $currentMonth)->count();
            
            $monthlyAmount = Order::whereIn('pharmacy_id', $pharmacyIds)
                ->whereMonth('orders.created_at', $currentMonth)
                ->join('order_items', 'orders.id', '=', 'order_items.order_id')
                ->select(DB::raw('SUM(order_items.quantity * order_items.unit_price * (1 - order_items.discount_percentage / 100)) as total_amount'))
                ->first()
                ->total_amount ?? 0;
            
            // Calculer le taux de conversion
            $conversionRate = $totalPharmacies > 0 ? round(($clientPharmacies / $totalPharmacies) * 100, 2) : 0;
            
            // Calculer le panier moyen
            $averageCart = $totalOrders > 0 ? round($totalOrdersAmount / $totalOrders, 2) : 0;
            
            // Récupérer les commandes récentes avec les détails de la pharmacie et les items
            $recentOrders = Order::with(['pharmacy', 'items'])
                ->whereIn('pharmacy_id', $pharmacyIds)
                ->latest()
                ->take(5)
                ->get();
            
            // Récupérer les documents récents
            $recentDocuments = $user->documents()
                ->latest()
                ->take(5)
                ->get();
            
            // Récupérer les pharmacies récentes
            $recentPharmacies = $pharmacies->latest()->take(5)->get();
            
            $data = [
                'total_pharmacies' => $totalPharmacies,
                'client_pharmacies' => $clientPharmacies,
                'prospect_pharmacies' => $prospectPharmacies,
                'total_orders' => $totalOrders,
                'total_orders_amount' => $totalOrdersAmount,
                'monthly_orders' => $monthlyOrders,
                'monthly_amount' => $monthlyAmount,
                'conversion_rate' => $conversionRate,
                'average_cart' => $averageCart,
                'recent_orders' => $recentOrders,
                'recent_documents' => $recentDocuments,
                'recent_pharmacies' => $recentPharmacies,
            ];
        }

        if (auth()->user()->role === 'admin') {
            $notifications = Notification::where('notifiable_id', auth()->id())
                ->where('notifiable_type', User::class)
                ->whereNull('read_at')
                ->orderBy('created_at', 'desc')
                ->get();
        } else {
            $notifications = collect();
        }

        $data['notifications'] = $notifications;

        return view('dashboard', $data);
    }

    private function calculateConversionRate($user)
    {
        $totalPharmacies = $user->pharmacies->count();
        $clientPharmacies = $user->pharmacies->where('status', 'client')->count();
        
        if ($totalPharmacies === 0) {
            return 0;
        }
        
        return round(($clientPharmacies / $totalPharmacies) * 100, 2);
    }

    private function calculateAverageCart($user)
    {
        $orders = Order::whereIn('pharmacy_id', $user->pharmacies->pluck('id'))->get();
        
        if ($orders->isEmpty()) {
            return 0;
        }
        
        return round($orders->avg('total'), 2);
    }

    private function countTotalDocuments()
    {
        return Document::count();
    }
}