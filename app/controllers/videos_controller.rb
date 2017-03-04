class VideosController < ApplicationController
  def index
    @video_categories_concept   = VideoCategory.where(category_type: VideoCategory::TYPE_CONCEPT).eager_load(:videos)
    @video_categories_letsplay  = VideoCategory.where(category_type: VideoCategory::TYPE_LP).eager_load(:videos)
    @video_categories_other  = VideoCategory.where(category_type: VideoCategory::TYPE_OTHER).eager_load(:videos)
  end

  def show
    @video = Video.find_by_id(params[:id])

    if (!@video)
      respond_to do |format|
        format.html { redirect_to videos_url }
        format.json { render json: {}, :status => 404 }
      end
      return
    end

    respond_to do |format|
      format.html
      format.json { render json: @video.as_json }
    end
  end

  def showCategory
    @video_category = VideoCategory.where(id: params[:category_id]).eager_load(:videos).first

    if (!@video_category)
      respond_to do |format|
        format.html { redirect_to videos_url }
        format.json { render json: {}, :status => 404 }
      end
      return
    end
    respond_to do |format|
      format.html
      format.json { render json: @video_category.videos.limit(6).as_json({
        methods: :image_link,
        except: [:image_id],
      }) }
    end
  end
end
