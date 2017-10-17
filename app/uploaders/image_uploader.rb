class ImageUploader < CarrierWave::Uploader::Base
  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::MiniMagick

  # 画像の上限を1200pxにする
  process :resize_to_limit => [1200, 1200]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  # ファイル名は日本語が入ってくると嫌なので、下記のようにしてみてもいい。
  # 日付(20131001.jpgみたいなファイル名)で保存する
  def filename
    time = Time.now
    name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
    name.downcase
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end
