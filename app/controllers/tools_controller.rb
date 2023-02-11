class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.new
    # @review = Review.new(tool: @tool)
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
