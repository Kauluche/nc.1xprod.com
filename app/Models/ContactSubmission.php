<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContactSubmission extends Model
{
    protected $fillable = ['name', 'email', 'message', 'rgpd_consent'];
}