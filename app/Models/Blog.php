<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Blog extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'blog_posts';
    
    protected $fillable = [
        'title',
        'slug',
        'content',
        'featured_image',
        'meta_description',
        'is_published',
        'published_at',
        'author_id'
    ];

    protected $casts = [
        'is_published' => 'boolean',
        'published_at' => 'datetime',
    ];

    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }

    public function getExcerpt($length = 150)
    {
        return substr(strip_tags($this->content), 0, $length) . '...';
    }
}
