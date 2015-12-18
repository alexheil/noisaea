module VideosHelper

  def embed(youtube_video_url)
    youtube_id = youtube_video_url.split("=").last
    content_tag(:iframe, nil, src: "//youtube.com/embed/#{youtube_id}")
  end

end
