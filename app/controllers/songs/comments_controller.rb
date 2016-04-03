class Songs::CommentsController < CommentsController
    before_action :set_commentable
    
    private
        def set_commentable
            @commentable = Song.find(params[:song_id])
        end
end