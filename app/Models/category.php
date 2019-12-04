<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    protected $primaryKey = 'category_id';

    protected $fillable = ['category', 'category_description', 'page_number', 'title_id', 'order'];

    public function products()
    {
        return $this->hasMany(product::class, 'category_id');
    }

    public function title()
    {
        return $this->belongsTo(page_title::class, 'title_id');
    }
    
}
