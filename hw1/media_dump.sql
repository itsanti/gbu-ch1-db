DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR(50) NOT NULL,
  `desc` VARCHAR(500),
  `type` ENUM('photo', 'audio', 'video') NOT NULL DEFAULT 'photo',
  `path_id` BIGINT UNSIGNED NOT NULL,
  `owner_id` BIGINT UNSIGNED NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `media_path`;
CREATE TABLE `media_path` (
  `id` SERIAL PRIMARY KEY,
  `path` VARCHAR(210) NOT NULL
);

DROP TABLE IF EXISTS `media_tags`;
CREATE TABLE `media_tags` (
  `id` SERIAL PRIMARY KEY,
  `tag` VARCHAR(20)
);

DROP TABLE IF EXISTS `media_file_tag`;
CREATE TABLE `media_file_tag` (
  `id` SERIAL PRIMARY KEY,
  `media_id` BIGINT UNSIGNED NOT NULL,
  `tag_id` BIGINT UNSIGNED NOT NULL
);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE `media` ADD CONSTRAINT `fk_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);
ALTER TABLE `media` ADD CONSTRAINT `fk_pathid` FOREIGN KEY (`path_id`) REFERENCES `media_path` (`id`);

ALTER TABLE `media_file_tag` ADD CONSTRAINT `fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);
ALTER TABLE `media_file_tag` ADD CONSTRAINT `fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `media_tags` (`id`);