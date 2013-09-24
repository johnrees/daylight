class HomepageVideoUploader < CarrierWave::Uploader::Base
  include Rails.application.routes.url_helpers
  Rails.application.routes.default_url_options = ActionMailer::Base.default_url_options

  storage :fog

  unless Rails.env.test?
    after :store, :zencode
  end

  def store_dir
    "homepage_videos/#{model.id}"
  end

  # def extension_white_list
  #   %w(mov avi mp4 mkv wmv mpg flv)
  # end

  # def filename
  #   "video.mp4" if original_filename
  # end

  private

  def zencode(args)
    base_url = "s3://#{ENV['AWS_S3_BUCKET']}/homepage_videos/#{@model.id}"
    input = "#{base_url}/#{original_filename}"

    notification_url = Rails.env.production? ? "http://newdaylight.herokuapp.com/zencoder-callback" : "http://daylight.pagekite.me/zencoder-callback"

    zencoder_response = Zencoder::Job.create({
      test: !Rails.env.production?,
      input: input,
      outputs: [
        {
          public: true,
          base_url: base_url,
          format: "webm",
          filename: "video.webm",
          label: "webm",
          size: "640x480",
          skip_audio: true,
          thumbnails: [
            {
              public: true,
              base_url: base_url,
              format: "jpg",
              label: "thumb",
              number: 5,
              width: 640,
              height: 480,
              aspect_mode: "crop",
              filename: "screenshot_{{number}}"
            }
          ]
        },
        {
          public: true,
          filename: "video.mp4",
          base_url: base_url,
          format: "mp4",
          label: "mp4",
          size: "640x480",
          max_video_bitrate: 1500,
          h264_profile: "baseline",
          h264_reference_frames: 1,
          max_frame_rate: 30,
          skip_audio: true
        }
      ]
    })

    Rails.logger.info(zencoder_response.inspect)

    # zencoder_response.body["outputs"].each do |output|
    #   if output["label"] == "web"
    #     @model.zencoder_output_id = output["id"]
    #     @model.thumbnail = "http://#{ENV['AWS_S3_BUCKET']}.s3.amazonaws.com/uploads/video/attachment/#{@model.id}/thumbnail_4.jpg"
    #     @model.processed = false
    #     @model.save(:validate => false)
    #   end
    # end

  end

end