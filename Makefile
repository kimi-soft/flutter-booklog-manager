all: build_android

clean:
	cd booklog_manager && \
	  flutter clean

build_android:
	cd booklog_manager && \
	  flutter build appbundle

update_app_icon:
	cd booklog_manager && \
	  flutter pub run flutter_launcher_icons:main

run_edge:
	cd booklog_manager && \
	  flutter run -d edge --web-browser-flag "--disable-web-security"
