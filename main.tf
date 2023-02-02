provider "google" {
    credentials = file("<credentials_file.json>")			# rubah <credentials_file.json> dengan file credentials google yang anda miliki
    project     = "<project_id>"					        # rubah <project_id> dengan google project_id yang anda miliki
    region      = "us-central1"								# region					
    zone        = "us-central1-a"							# zone
}

resource "google_sql_database_instance" "mysql" {
  name                  = "mysql-dbinstance"
  region                = "us-central1"
  database_version      = "MYSQL_8_0"
  deletion_protection   = false
  root_password         = "<db_password>"				    # rubah root <db_password> dengan password database yang anda buat
}

  settings {
    tier                = "db-f1-micro"
    availability_type   = "ZONAL"
    disk_size           = 32
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {									# enable public access
        name = "public-access"								
        value = "0.0.0.0/0"
      }
    }
  }
}

resource "google_sql_user" "example_user" {					# buat mysql_user baru
  name     = "admin"
  instance = google_sql_database_instance.mysql.name
  password = "<db_password>"                                # rubah <db_password> dengan password database yang anda buat
}

