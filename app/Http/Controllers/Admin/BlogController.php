<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $blogs = Blog::with('author')->orderBy('created_at', 'desc')->paginate(10);
        return view('admin.blogs.index', compact('blogs'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.blogs.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|max:255',
            'content' => 'required',
            'featured_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'meta_description' => 'nullable|max:255',
            'is_published' => 'nullable|boolean',
        ]);

        $blog = new Blog();
        $blog->title = $validated['title'];
        $blog->slug = Str::slug($validated['title']);
        $blog->content = $validated['content'];
        $blog->meta_description = $validated['meta_description'] ?? null;
        $blog->is_published = $request->has('is_published');
        $blog->published_at = $blog->is_published ? now() : null;
        $blog->author_id = Auth::id();

        if ($request->hasFile('featured_image')) {
            $file = $request->file('featured_image');
            $fileName = time() . '_' . $file->getClientOriginalName();
            
            // Stocker l'image dans le dossier public/images/blog
            $file->move(public_path('images/blog'), $fileName);
            
            // Enregistrer le chemin relatif dans la base de données
            $blog->featured_image = 'images/blog/' . $fileName;
        }

        $blog->save();

        return redirect()->route('admin.blogs.index')->with('success', 'Article créé avec succès.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Blog $blog)
    {
        return view('admin.blogs.edit', compact('blog'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Blog $blog)
    {
        $validated = $request->validate([
            'title' => 'required|max:255',
            'content' => 'required',
            'featured_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'meta_description' => 'nullable|max:255',
            'is_published' => 'nullable|boolean',
        ]);

        $blog->title = $validated['title'];
        $blog->slug = Str::slug($validated['title']);
        $blog->content = $validated['content'];
        $blog->meta_description = $validated['meta_description'] ?? null;
        
        // Gestion de la publication - approche directe
        $is_published = $request->has('is_published');
        
        // Mise à jour du statut de publication
        $blog->is_published = $is_published;
        
        // Si on publie un article qui n'était pas publié avant ou si on le dépublie
        if ($is_published && empty($blog->published_at)) {
            $blog->published_at = now();
        } elseif (!$is_published) {
            // Si on dépublie, on garde la date de publication pour historique
            // mais on pourrait aussi la mettre à null si nécessaire
            // $blog->published_at = null;
        }

        if ($request->hasFile('featured_image')) {
            // Supprimer l'ancienne image si elle existe
            if ($blog->featured_image && file_exists(public_path($blog->featured_image))) {
                unlink(public_path($blog->featured_image));
            }
            
            $file = $request->file('featured_image');
            $fileName = time() . '_' . $file->getClientOriginalName();
            
            // Stocker l'image dans le dossier public/images/blog
            $file->move(public_path('images/blog'), $fileName);
            
            // Enregistrer le chemin relatif dans la base de données
            $blog->featured_image = 'images/blog/' . $fileName;
        }

        $blog->save();

        return redirect()->route('admin.blogs.index')->with('success', 'Article mis à jour avec succès.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Blog $blog)
    {
        // Supprimer l'image si elle existe
        if ($blog->featured_image) {
            Storage::delete('public/' . $blog->featured_image);
        }
        
        $blog->delete();
        
        return redirect()->route('admin.blogs.index')->with('success', 'Article supprimé avec succès.');
    }
}
