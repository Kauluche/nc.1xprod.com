<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    /**
     * Récupère les articles de blog publiés
     * 
     * @param bool $returnData Si true, retourne les données au lieu de la vue
     * @return \Illuminate\View\View|array
     */
    public function index($returnData = false)
    {
        // Récupérer les articles publiés, triés par date de publication décroissante
        $articles = Blog::where('is_published', true)
            ->orderBy('published_at', 'desc')
            ->get()
            ->map(function ($blog) {
                return [
                    'id' => $blog->id,
                    'title' => $blog->title,
                    'excerpt' => $blog->getExcerpt(),
                    'content' => $blog->content,
                    'image' => $blog->featured_image ?? 'images/vitrine/blog/default.jpg',
                    'date' => $blog->published_at->format('Y-m-d'),
                    'author' => $blog->author ? $blog->author->first_name . ' ' . $blog->author->last_name : 'Admin',
                    'category' => 'Blog' // À adapter si vous ajoutez des catégories plus tard
                ];
            });

        // Si aucun article n'est trouvé, utiliser les articles statiques par défaut
        if ($articles->isEmpty()) {
            $articles = $this->getDefaultArticles();
        }
        
        // Si on demande juste les données, les retourner directement
        if ($returnData) {
            return $articles;
        }

        // Sinon, retourner la vue avec les articles
        return view('blog.index', compact('articles'));
    }

    public function show($id)
    {
        // Récupérer l'article depuis la base de données
        $blog = Blog::where('id', $id)
            ->where('is_published', true)
            ->first();

        if ($blog) {
            $article = [
                'id' => $blog->id,
                'title' => $blog->title,
                'content' => $blog->content,
                'image' => $blog->featured_image ?? 'images/vitrine/blog/default.jpg',
                'date' => $blog->published_at->format('Y-m-d'),
                'author' => $blog->author ? $blog->author->first_name . ' ' . $blog->author->last_name : 'Admin',
                'category' => 'Blog' // À adapter si vous ajoutez des catégories plus tard
            ];
        } else {
            // Si l'article n'est pas trouvé dans la base de données, vérifier les articles statiques
            $defaultArticles = $this->getDefaultArticles(true);
            
            if (!isset($defaultArticles[$id])) {
                abort(404);
            }
            
            $article = $defaultArticles[$id];
        }

        return view('blog.show', compact('article'));
    }

    /**
     * Retourne les articles statiques par défaut
     * 
     * @param bool $forShow Si true, retourne un tableau associatif avec les IDs comme clés
     * @return array
     */
    private function getDefaultArticles($forShow = false)
    {
        $articles = [
            [
                'id' => 1,
                'title' => 'Les bienfaits des champignons médicinaux',
                'excerpt' => 'Découvrez comment les champignons médicinaux peuvent améliorer votre santé et votre bien-être au quotidien.',
                'content' => 'Les champignons médicinaux sont utilisés depuis des millénaires dans la médecine traditionnelle chinoise. Ils contiennent des composés bioactifs qui renforcent le système immunitaire, améliorent la digestion et réduisent le stress. Parmi les plus connus, on trouve le Reishi, le Shiitake et le Maitake.

Le Reishi, également appelé "champignon de l\'immortalité", est particulièrement réputé pour ses propriétés adaptogènes. Il aide l\'organisme à s\'adapter au stress et renforce les défenses naturelles.

Le Shiitake, quant à lui, est riche en lentinane, un composé qui stimule le système immunitaire. Il est également une excellente source de vitamines B et de minéraux essentiels.

Le Maitake, surnommé "le roi des champignons", est particulièrement efficace pour réguler la glycémie et soutenir le système immunitaire.

Pour profiter pleinement des bienfaits de ces champignons, il est recommandé de les consommer sous forme de compléments alimentaires de haute qualité, comme ceux proposés par NaturaCorp.',
                'image' => 'images/vitrine/blog/champignons.jpg',
                'date' => '2024-03-15',
                'author' => 'Dr. Sophie Martin',
                'category' => 'Santé'
            ],
            [
                'id' => 2,
                'title' => 'L\'importance des compléments alimentaires naturels',
                'excerpt' => 'Pourquoi les compléments alimentaires naturels sont-ils essentiels dans notre mode de vie moderne ?',
                'content' => 'Dans notre société actuelle, il est souvent difficile de maintenir une alimentation équilibrée. Les compléments alimentaires naturels peuvent nous aider à combler les carences nutritionnelles et à maintenir un bon équilibre de notre organisme.

Les raisons pour lesquelles les compléments alimentaires sont devenus essentiels sont multiples :

1. La diminution de la qualité nutritionnelle des aliments
2. Le stress et la pollution qui augmentent nos besoins en nutriments
3. Les modes de vie modernes qui ne permettent pas toujours une alimentation optimale

Chez NaturaCorp, nous sélectionnons rigoureusement les ingrédients de nos compléments alimentaires pour garantir leur qualité et leur efficacité. Nos produits sont fabriqués en France selon les normes les plus strictes.',
                'image' => 'images/vitrine/blog/complements.jpg',
                'date' => '2024-03-10',
                'author' => 'Dr. Jean Dupont',
                'category' => 'Nutrition'
            ],
            [
                'id' => 3,
                'title' => 'Les secrets de la médecine traditionnelle',
                'excerpt' => 'Explorez les trésors de la médecine traditionnelle et leur application dans le monde moderne.',
                'content' => 'La médecine traditionnelle regorge de connaissances précieuses sur l\'utilisation des plantes et des champignons. Ces savoirs ancestraux, combinés aux avancées scientifiques modernes, ouvrent de nouvelles perspectives pour la santé et le bien-être.

Les principes fondamentaux de la médecine traditionnelle incluent :

- L\'approche holistique de la santé
- L\'utilisation de remèdes naturels
- La prévention plutôt que le traitement
- L\'équilibre entre le corps et l\'esprit

Chez NaturaCorp, nous nous inspirons de ces principes pour développer des produits qui respectent l\'équilibre naturel de l\'organisme tout en bénéficiant des avancées de la science moderne.',
                'image' => 'images/vitrine/blog/medecine.jpg',
                'date' => '2024-03-05',
                'author' => 'Dr. Marie Laurent',
                'category' => 'Médecine'
            ]
        ];

        if ($forShow) {
            $result = [];
            foreach ($articles as $article) {
                $result[$article['id']] = $article;
            }
            return $result;
        }

        return $articles;
    }
} 