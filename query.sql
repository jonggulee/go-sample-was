CREATE USER 'cspadmin'@'%' IDENTIFIED BY 'cspadmin!';
GRANT ALL PRIVILEGES ON csp_db.* TO 'cspadmin'@'%';
CREATE DATABASE csp_db;
FLUSH PRIVILEGES;

USE csp_db;
CREATE TABLE IF NOT EXISTS list (
  id INT AUTO_INCREMENT PRIMARY KEY,
  csp_name VARCHAR(100),
  virtual_servers VARCHAR(100),
  platform_as_a_service VARCHAR(100),
  serverless_computing VARCHAR(100),
  docker_management VARCHAR(100),
  kubernetes_management VARCHAR(100),
  object_storage VARCHAR(100),
  global_content_delivery VARCHAR(100)
);

INSERT INTO list (csp_name, virtual_servers, platform_as_a_service, serverless_computing, docker_management, kubernetes_management, object_storage, global_content_delivery)
VALUES 
('AWS', 'Instances', 'Elastic Beanstalk', 'Lambda', 'ECS', 'EKS', 'S3', 'CloudFront'),
('Microsoft Azure', 'VMs', 'Cloud Services', 'Azure Functions', 'Container Service', 'Kubernetes Service', 'Block Blob', 'Delivery Network'),
('Google Cloud Platform', 'VM Instances', 'App Engine', 'Cloud Functions', 'Container Engine', 'Kubernetes Engine', 'Cloud Storage', 'Cloud CDN');