module Api
    module V1
        class ArticlesController < ApplicationController
            def index 
                @articles = Article.order('created_at DESC') 
                render json: {
                    staus: 'SUCCEX',
                    message: 'loaded the articles',
                    data: @articles
                },
                staus: 'ok'
            end

            def show 
                @articles = Article.find(params[:id])
                render json: {
                    staus: 'SUCCESS',
                    message: 'loaded the articles',
                    data: @articles
                },
                staus: 'ok'
            end

            def create 
                article = Article.new(article_params)

                if article.save
                    render json: {
                        staus: 'SUCCESS',
                        message: 'saved new article',
                        data: article
                    },
                    staus: 'ok'
                else
                    render json: {
                        staus: 'Fatal fail',
                        message: 'article not saved',
                        data: article.errors
                    },
                    staus: 'Enigmatic Entity'
                end
            end

            def destroy
                article = Article.find(params[:id])
                article.destroy
                render json: {
                    staus: 'SUCCESS',
                    message: 'Article Deleted',
                    data: article
                },
                staus: 'od'
            end

            def update
                article = Article.find(params[:id])
                if article.update_attributes(article_params)
                    render json: {
                        staus: 'SUCCESS',
                        message: 'Updated the article article',
                        data: article
                    },
                    staus: 'ok'
                else
                    render json: {
                        staus: 'Fatal fail',
                        message: 'article not updated',
                        data: article.errors
                    },
                    staus: 'Enigmatic Entity'
                end
            end

            private 
            
            def article_params
                params.permit(:title, :body)
            end

        end
    end
end