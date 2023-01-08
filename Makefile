.PHONY: init
init:
	flutter pub global deactivate protoc_plugin
	flutter pub global activate protoc_plugin


.PHONY: proto
proto:
	chcp 65001
	del /q /s lib\generated
	protoc -I proto --dart_out=lib\generated \
		google/protobuf/timestamp.proto \
		app_user.proto \
		vol_request.proto \
		search_request.proto \
		operation.proto \
		chat.proto \
		comment.proto \
		message.proto