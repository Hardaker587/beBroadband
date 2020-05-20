
		function is_mobile(){
			var mobile=(/iphone|ipod|android|blackberry|mini|nokia|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));
			return mobile;
		}
		if(screen.width<700 || is_mobile() ){
			document.getElementById('device').value="mobile";
		}
		document.getElementById('width').value=screen.width;

		document.redirect.submit();
