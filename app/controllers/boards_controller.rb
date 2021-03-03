class BoardsController < ApplicationController
  before_action :find_board, only: [:edit, :update, :show, :destory]
  def index
    @boards = Board.all.page(params[:page]).per(10)
  end

  def show 
  end

  def new 
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path, notice: "已新增看板！"
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: "看板已更新！"
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: "看板已刪除！"
  end
private
  def find_board
    @board = Board.find(params[:id])
  end
  def board_params
    params.require(:board).permit(:title)
  end
end
