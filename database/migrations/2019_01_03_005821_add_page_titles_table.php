<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPageTitlesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        
        Schema::create('page_titles', function (Blueprint $table) {
            $table->increments('title_id');
            $table->string('title_name')->nullable();
            $table->string('title_description')->nullable();
            $table->string('title_size')->nullable();
            $table->timestamps();
         });

         Schema::table('categories', function($table) {
            $table->integer('page_number')->nullable()->after('category_description');
            $table->integer('title_id')->nullable()->unsigned();
            $table->foreign('title_id')->references('title_id')->on('page_titles')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('categories', function($table) {
            $table->dropForeign('categories_title_id_foreign');
            $table->dropColumn('title_id');
            $table->dropColumn('page_number');
        });

        Schema::dropIfExists('page_titles');
    }
}
