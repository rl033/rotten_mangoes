class MoviesController < ApplicationController

      def index
        # binding.pry
        if params[:title] != ''
          @movies = Movie.where("title like ?", "%#{params[:title]}%")
        elsif params[:director] != ''
          @movies = Movie.where("director like ?", "%#{params[:director]}%")
        elsif params[:duration] != ''
          case params[:duration]
          when 'Under 90 minutes'
            @movies = Movie.where("runtime_in_minutes < 90")
          when 'Between 90 and 120 minutes'
            @movies = Movie.where("runtime_in_minutes >= 90 AND runtime_in_minutes <= 120")
          when 'Over 120 minutes'
            @movies = Movie.where("runtime_in_minutes > 120")
          end
        else
          @movies = Movie.all
        end
      end

      def show
        # binding.pry
        @movie = Movie.find(params[:id])
      end

      def new
        @movie = Movie.new
      end

      def edit
        @movie = Movie.find(params[:id])
      end

      # def search
      #   if params[:title]
      #     @movies = Movie.where("title like ?", "%#{params[:title]}%")
      #   else
      #     @movies = Movie.all
      #   end
      #   redirect_to movies_path(movie_params[:title])
      # end

      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
        else
          render :new
        end
      end

      def update
        @movie = Movie.find(params[:id])

        if @movie.update_attributes(movie_params)
          redirect_to movie_path(@movie)
        else
          render :edit
        end
      end

      def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_path
      end



      protected

      def movie_params
        params.require(:movie).permit(
          :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :poster
        )
      end

    end