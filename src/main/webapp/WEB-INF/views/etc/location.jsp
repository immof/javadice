<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 오시는길 ::</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35e9c2cc825772a573101a12680ecaab"></script>
<style>
  	.loc-wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .loc-wrap * {padding: 0;margin: 0;}
    .loc-wrap .loc-info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .loc-wrap .loc-info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .loc-info .loc-title {padding: 5px 0 0 10px;height: 30px;background: #998465;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;font-family: ns-regular;color:#fff}
    .loc-info .loc-body {position: relative;overflow: hidden;}
    .loc-info .loc-desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .loc-desc .loc-ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .loc-desc .loc-jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .loc-info .loc-img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .loc-info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .loc-info .loc-link {color: #5085BB;}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

	<div class="page-content">
		<div class="flex-wrap">
			<div id="map" style="width: 1200px; height: 500px;"></div>
			<div><a href="https://map.kakao.com/?urlX=477188&urlY=1120681&urlLevel=3&itemId=1139403627">지도에서 보기</a> </div>
		</div>
	</div>

	<script>
		// 37.533837,126.896836
		$(function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.533837, 126.896836), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({
				// 지도 중심좌표에 마커를 생성합니다 
				position : map.getCenter()
			});
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
				var content = '<div class="loc-wrap">' + 
			    '    <div class="loc-info">' + 
			    '        <div class="loc-title">' + 
			    '            JAVADICE CITY' + 
			    '            <div class="loc-close" onclick="closeOverlay()" title="닫기"></div>' + 
			    '        </div>' + 
			    '        <div class="loc-body">' + 
			    '            <div class="loc-img">' +
			    '                <img src="./img/javadice_logo_only.png" width="73" height="70">' +
			    '           </div>' + 
			    '            <div class="loc-desc">' + 
			    '                <div class="loc-ellipsis">서울특별시 영등포구 선유동2로 57 이레빌딩</div>' + 
			    '                <div class="loc-jibun loc-ellipsis">herejava@naver.com</div>' + 
			    '                <div><a href="http://localhost" target="_blank" class="link">홈페이지</a></div>' + 
			    '            </div>' + 
			    '        </div>' + 
			    '    </div>' +    
			    '</div>';
			    			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
				content : content,
				map : map,
				position : marker.getPosition()
			});
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				overlay.setMap(map);
			});
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>