resource "google_filestore_instance" "instance" {
  name = "tf-filestore"
  location = "us-central1-a"
  tier = "BASIC_SSD"

  file_shares {
    capacity_gb = 2660
    name        = "tfdemo"

    nfs_export_options {
      ip_ranges = ["10.10.30.4/24"]
      access_mode = "READ_WRITE"
      squash_mode = "NO_ROOT_SQUASH"
   }

   nfs_export_options {
      ip_ranges = ["10.10.30.3/24"]
      access_mode = "READ_ONLY"
      squash_mode = "ROOT_SQUASH"
      anon_uid = 123
      anon_gid = 456
   }
  }

  networks {
    network = "aws-migration"
    modes   = ["192.168.0.5/29"]
    connect_mode = "DIRECT_PEERING"
  }
}