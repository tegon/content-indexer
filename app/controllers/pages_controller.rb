class PagesController < ApplicationController
  def create
    @page = Page.new(page_params)

    if @page.save
      index_page_content
      render json: @page, status: :created
    else
      render json: @page.errors, status: :unprocessable_entity
    end
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
end
