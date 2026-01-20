class_name AndroidHelpers

static var __android_api = null


static func init () -> bool:
	__android_api = Engine.get_singleton ("AndroidRuntime")
	
	if __android_api == null:
		return false
		
	return true
