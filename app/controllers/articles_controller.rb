class ArticlesController < ApplicationController

    def show
        #byebug will debug your code
        #byebug
        #we need a instance vairalbe to use it in the show.html
        @article = Article.find(params[:id])
    end
end