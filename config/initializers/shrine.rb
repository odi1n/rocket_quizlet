require "shrine"
require "shrine/storage/file_system"

Shrine.logger = Rails.logger

# Choose your favorite image processor
require 'image_processing/mini_magick'
SHRINE_PICTURE_PROCESSOR = ImageProcessing::MiniMagick

Shrine.storages = {
  # temporary
  cache: Shrine::Storage::FileSystem.new(
    "public",
    prefix: "uploads/cache"
  ),
  # permanent
  store: Shrine::Storage::FileSystem.new(
    "public",
    prefix: "uploads"
  ),
}

Shrine.plugin :upload_options, cache: { move: true }, store: { move: true }

Shrine.plugin :custom_pretty_location, class_underscore: :true

Shrine.plugin :determine_mime_type

Shrine.plugin :instrumentation

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files

Shrine.plugin :validation_helpers
Shrine.plugin :derivatives

require 'ckeditor/backend/shrine'
