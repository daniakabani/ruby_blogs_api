module Api
    module V1
        class ArticlesController < ApplicationController
            def index 
                @articles = Article.order('created_at DESC') 
                renderer('SUCCESS', 'loaded the articles', @articles)
            end

            def show 
                article = Article.find(params[:id])
                renderer('SUCCESS', 'loaded the articles', article)
            end

            def create 
                article = Article.new(article_params)

                if article.save
                    renderer('SUCCESS', 'saved new article', article)
                else
                    renderer('FAILED', 'Engimatic entity can not be processes', article)
                end
            end

            def destroy
                article = Article.find(params[:id])
                article.destroy
                renderer('SUCCESS', 'Article Deleted', article)
            end

            def update
                article = Article.find(params[:id])
                if article.update_attributes(article_params)
                    renderer('SUCCESS', 'Updated the article article', article)
                else
                    renderer('FAILED', 'article not updated', article)
                end
            end

            private 
            
            def article_params
                params.permit(:title, :body)
            end

            def renderer (status, message, data)
                render json:{
                    status: status, 
                    message: message,
                    data: data
                }
            end

        end
    end
end