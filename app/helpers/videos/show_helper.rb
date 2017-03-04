module Videos
  module ShowHelper
    def self.view_parameters(video)
      {
        title: video.name,
        text: '',
        id: 'video_' + video.id.to_s,
        iframe: self.convertYTToEmbed(video.link)
      }
    end

    def self.convertYTToEmbed(youtube_url)
      if (youtube_url)
        youtube_url.gsub!('https://www.youtube.com/watch?v=', 'https://www.youtube.com/embed/')
      end
      youtube_url
    end
  end
end
