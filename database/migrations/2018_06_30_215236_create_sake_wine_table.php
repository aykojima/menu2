<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSakeWineTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->increments('category_id');
            $table->string('category', 500)->nullable();
            $table->text('description')->nullable();
            $table->timestamps();
         });
 
        Schema::create('products', function (Blueprint $table) {
            $table->increments('product_id');
            $table->string('name', 500)->nullable();
            $table->integer('price')->nullable();
            $table->string('production_area', 500)->nullable();
            $table->text('description')->nullable();
            $table->timestamps();
        });

        Schema::table('products', function (Blueprint $table) {        
            $table->integer('category_id')->unsigned();
            $table->foreign('category_id')->references('category_id')->on('categories')
                ->onDelete('cascade');
        });

        

         Schema::create('sakes', function (Blueprint $table) {
            $table->increments('sake_id');
            $table->string('grade', 500)->nullable();
            $table->string('rice', 500)->nullable();
            $table->string('sweetness', 500)->nullable();
            $table->timestamps();
         });

         Schema::table('sakes', function (Blueprint $table) {        
            $table->integer('product_id')->unsigned();
            $table->foreign('product_id')->references('product_id')->on('products')
                ->onDelete('cascade');
        });

         Schema::create('wines', function (Blueprint $table) {
            $table->increments('wine_id');
            $table->string('type', 500)->nullable();
            $table->string('year', 500)->nullable();
            $table->timestamps();
         });

         Schema::table('wines', function (Blueprint $table) {        
            $table->integer('product_id')->unsigned();
            $table->foreign('product_id')->references('product_id')->on('products')
                ->onDelete('cascade');
        });

         Schema::create('bottles', function (Blueprint $table) {
            $table->increments('bottle_id');
            $table->string('size', 500)->nullable();
            $table->integer('second_price')->nullable();
            
         });

         Schema::table('bottles', function (Blueprint $table) {        
            $table->integer('sake_id')->nullable()->unsigned();
            $table->foreign('sake_id')->references('sake_id')->on('sakes')
                ->onDelete('cascade');

            $table->integer('wine_id')->nullable()->unsigned();
            $table->foreign('wine_id')->references('wine_id')->on('wines')
                ->onDelete('cascade');
            $table->timestamps();
        });         
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('bottles', function($table) { 
            $table->dropForeign(['sake_id']);
            $table->dropColumn('sake_id');
            $table->dropForeign(['wine_id']);
            $table->dropColumn('wine_id');
        });
        
        Schema::dropIfExists('bottles');

        Schema::table('wines', function($table) { 
            $table->dropForeign(['category_id']);
            $table->dropColumn('category_id');
        });

        Schema::dropIfExists('wines');

        Schema::table('sakes', function($table) { 
            $table->dropForeign(['product_id']);
            $table->dropColumn('product_id');
        });
        
        Schema::dropIfExists('sakes');

        Schema::table('products', function($table) { 
            $table->dropForeign(['category_id']);
            $table->dropColumn('category_id');
        });
        
        Schema::dropIfExists('products');
        
        Schema::dropIfExists('categories');
    }
}
