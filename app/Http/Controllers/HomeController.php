<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Affiche la page d'accueil du site vitrine.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        // Instancier le BlogController pour récupérer les articles
        $blogController = new BlogController();
        $articles = $blogController->index(true); // true pour récupérer les données directement
        
        // Limiter à 3 articles pour la page d'accueil
        // Vérifier si $articles est une collection ou un tableau
        if (is_object($articles) && method_exists($articles, 'toArray')) {
            $articlesArray = $articles->toArray();
        } else {
            $articlesArray = $articles;
        }
        
        $latestArticles = array_slice($articlesArray, 0, 3);
        
        return view('home', compact('latestArticles'));
    }
} 