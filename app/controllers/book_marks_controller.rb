# frozen_string_literal: true

class BookMarksController < ApplicationController
  def create
    book_mark = current_user.book_marks.find_or_initialize_by(tweet_id: params[:tweet_id])
    if book_mark.new_record?
      book_mark.save
    else
      book_mark.destroy
    end
    redirect_to request.referer
  end

  def index
    @tweets = Tweet.joins(:book_marks).where(book_marks: { user_id: current_user.id })
                   .order(created_at: :desc).page(params[:page])
  end
end
