class Admin::TagsController < Admin::ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc)
  end

  def create
    tags_parms[:name].split(',').map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice: 'Tag was successfully created'
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def tags_parms
    params.require(:tag).permit(:id, :name)
  end
end
