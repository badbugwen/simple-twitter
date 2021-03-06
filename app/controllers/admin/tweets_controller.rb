class Admin::TweetsController < Admin::BaseController
  def index
    @tweets = Tweet.all
    @ordered_tweets = @tweets.includes(:replies).order(created_at: :desc)
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to admin_root_path, alert: 'Tweet Deleted Successfully'
  end
end
