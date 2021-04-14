class NewsUploader < Shrine
  plugin :determine_mime_type
  plugin :validation_helpers
  plugin :derivatives

  Attacher.validate do
    validate_mime_type_inclusion %w[image/jpeg image/gif image/png]
    validate_max_size 2.megabytes
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      main:  magick.resize_to_limit!(800, 800),
      thumb:  magick.resize_to_limit!(300, 300)
    }
  end
end
