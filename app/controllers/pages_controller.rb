class PagesController < ApplicationController
  def index
    render json: Page.all
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      index_page_content
      render json: @page, status: :created
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  def show
    @page = Page.includes(:links, :tags).find(params[:id])
    render json: @page, include_associations: true
  end

  private

  def page_params
    params.require(:page).permit(:url)
  end

  def index_page_content
    crawler = Crawler.new(@page.url)
    @page.links.create(crawler.links)
    @page.tags.create(crawler.tags)
  end

  def include_associations?
    false
  end
end
