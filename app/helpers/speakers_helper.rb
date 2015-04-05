module SpeakersHelper
  def speaker_params
    params.require(:speaker).permit(:name, :headline, :contact, :topics, :description)
  end
end
