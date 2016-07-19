class Attachment < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  mount_uploader :attachment, AttachmentUploader

  delegate :url, :size, :path, to: :attachment

  before_save :update_attachment_attributes

  private

  def update_attachment_attributes
    if attachment.present? && attachment_changed?
      self.original_filename = attachment.file.original_filename
      self.content_type = attachment.file.content_type
    end
  end
end
