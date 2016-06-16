Maid.rules do
  repeat '15m' do
    rule 'Sort Dropbox Camera Uploads into appropriate folders' do
      puts "hello from #{Time.now}!"
      camera_uploads = "~/Dropbox (Personal)/Camera Uploads"
      files(File.join(camera_uploads, "*")).each do |path|
        if media_type(path) == "image"
          filename = File.basename(path)
          if [[640, 1136], [1136, 640]].include? dimensions_px(path)
            new_path = File.join(camera_uploads, "Screenshots", filename)
            rename(path, new_path)
          else
            year_folder  = modified_at(path).year.to_s
            month_folder = modified_at(path).strftime("%m-%b")
            new_path     = File.join(camera_uploads, year_folder, month_folder, filename)
            rename(path, new_path)
          end
        end

        also_video = [
          ".aae",
          ".mp4" # mp4 media_type comes through as 'application'?
        ]

        if media_type(path) == "video" || also_video.include?(File.extname(path).downcase)
          filename = File.basename(path)
          year_folder  = modified_at(path).year.to_s
          month_folder = modified_at(path).strftime("%m-%b")
          new_path     = File.join(camera_uploads, year_folder, month_folder, "movies", filename)
          rename(path, new_path)
        end
      end
    end
  end
end
