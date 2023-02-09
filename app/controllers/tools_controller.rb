class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def tool_params
    params.require(:tool).permit(:type, :price, :postcode, :description)
  end
end
