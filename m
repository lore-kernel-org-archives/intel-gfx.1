Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7A606A333
	for <intel-gfx@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ReuGjFdv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQXHtvdb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851E10E76B;
	Sat, 24 Oct 2026 00:36:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22CD112D58
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:35:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NLvDAB371998
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=ReuGjFdv0Hrpztut
 yxC1lHP6EzBYxoEDj8WxTxhKWi+GZQjDs06NSw7K8JyweibefUBuDm/kbdLLeMOM
 /Qi5I0jb3oFjHjtwpk9gme+XP17dfzNDGFJQ/dzY733W513O0iszC8wtJ0ihy53X
 MeOyOsbjtRTzEfnIERh/1WFU9ytPZ8dwrc88Bw85XCFj/yYqpxVL8rytc/oqHIFr
 M61gUjpgss2No/7pmZxU7qp0U+EP27TXYeJiVvwur3c9+IErKX0L3IiIntbSA/R0
 qjGK/Yvaa4zMTK44b/hc+iie1TUHquIk9MYBZwy7MjLwFnaa1LoWCLp0s33yuuWb
 pAkUmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas89h7n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:35:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f6f4fe531so265303185a.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 17:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792802147; x=1793406947;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
 b=YQXHtvdbec/PL+ZBKaABK8ocT2b8lAY7WBi5TsTrLC361Q8tBMryvJT60ccovKiz9L
 fLeNHeDYypTfLe3IHLmT4XHppQtKbzBakyv6YZzcjn03ahJmwya4jE0pbUOlm1rQe0Oa
 9OUfy9qj+m9PitWihqFzwi+SbboVF43BZISKAgcfcr5Cy6SflbcC/5/B1tpFwwkZD5Wv
 AhwfugGteGCXE5XvgT480cw00r+MW9FjOz+0aNCnZHNomX5uckoPazWlP67z80FBFrlR
 eBq1CEuxrUdVGNDzeuvP6OZz2YHjoZG+TjUtHLoPjT56pLN4qkJApg4ICMtfnOuyjcy3
 4Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792802147; x=1793406947;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
 b=yUQ1X9AQP+SbkP09jhCuLdyFnMArPPkIxiprK9nLqeyoajRrYfQ0Tf8kE1EatI0rTd
 e1LV0rPIY4cY2d/0iDPmk49bzH3EyoIXi7lKAWNz2c9R1SfVsSOpUNygN3PUrwLHrUq6
 cMjToq4QiQq50safDhT/fOYl79mdU78vV2e9nKwNQK1xm1OLM7hMnWuYPmp+bhMbZAGC
 VqZMd8NCgmuD12JR+tuVAxB+iznFLCxf/fowvBkclcSvlnyxCWCDWbRSjIKpvFA5jh0t
 /9foZ7tN+EqCYq4UU/hJRqvgPlGfLCGpjfsxxD385S025jJ9sThI3Lbnu3K5ldmWyTaD
 1Wcw==
X-Forwarded-Encrypted: i=1;
 AKwUvByRhahW431ycB1Vbdija1saS9upYh9uew+o5XcPJhOgZe0XjMkSsyA8ltu5rtNx9mm5SX4+MNCIR0U=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYISsw0LcN+Y8Ow1eInAy2TkCYDWjgfXZtnVk/5UCDu1tiCj7DuI
 rFepKM1CqsHL5PxFUaE4U+64CdIj7M5ErgcUpb2o3+oReky6mvLanNDw5lNjaRKiPrlXuSePAyt
 pR+B5bDdaGBd4mRxY9J+6MDD+Wl9lOAfxgjwLVdA9MpW5HayPtODW5xQihx60ONjOPg6c4rE=
X-Gm-Gg: AYBFou2f9qnDYhHBcSUCiggx+0dfycs0/XzDuzaiP7+knwCukUCLSnif3JKtlrd90OL
 TCKca/4RqMdy8U2OI1LDan6SZ/lqR85n2nY3/fO0/d7oQhdiDgXItih1Xj63iiNiLNhjYNuolPU
 0Hh+j8Go/CWFwOL+FakBtZfr7bDtelBbrreVKRRjTCrr35tK0dv8VWgk71Og28ZPxmDEKF6FPc7
 H73mfd8zehw6KyrIxIUaJhlgn24mvimTLRjWL6PJDhxHhA7dQm6v2s1Oo/H/0tAZqzJnwh1yWxN
 /0QLx8YGpCuxsZSadR62V/MOnEx/S9XAaEitPmJK/s4yCgHKdjEorly/rR8FDp0qZzod78E3ksA
 //fYPSyxyEPHXpEFxxuwvNBspgpClRqWGv4NUw+80z+R24VtEQLRwUFU9aVAH+HkFg1ApuyqnL7
 zfkbJKzoomoYdk
X-Received: by 2002:a05:620a:370b:b0:93f:19fe:e6ca with SMTP id
 af79cd13be357-940ef939794mr102377185a.43.1792802147578; 
 Fri, 23 Oct 2026 17:35:47 -0700 (PDT)
X-Received: by 2002:a05:620a:370b:b0:93f:19fe:e6ca with SMTP id
 af79cd13be357-940ef939794mr102375885a.43.1792802147137; 
 Fri, 23 Oct 2026 17:35:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 17:35:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:18 +0300
Subject: [PATCH v8 2/9] drm/connector: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-2-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Francesco Dolcini <francesco@dolcini.it>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EorsOQHW0H0nqzv28S1rGKOICW2UJpSufyghXnThB60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1PEfQawOxcIPeQkTw3Ahbduv3n8MRID0UAN
 lY/P0w9/IGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9TwAKCRCLPIo+Aiko
 1YUHB/9tSxiaO49rIuYE1/it1nSy3oti+R7AeMvMDMfZiv9ikIhv8pNAkhXiSvwEmMMJW5yoa6e
 87vDylIusweUO7ajtlFct5rMYJSrD3u0Vnh6AuDNX3x4tGsdS2HThrv3QyLQtusxuYuxB2WjThM
 oYb4kRN6dAtPuCKl5vWij7/JN/dtpvYS3/ZBySxOrpLeiCKvS+cyMuR2OUSmpCpTEhobFS93XEx
 AWo/gjkuBAX0MzwDP/2sVdtWgioQaJpOTdngvcc7eva2QQuFTa9mdXj/LwgN0/GLBjbR/odeImX
 ZxMNtOaYpIkKbt/F6UWjooDUjgSW9nsHStYerCxrW8LV5yIj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX5ayT2c4RBeuU
 AzTMRSx8J2+wlYP3+L8AxYFHBjyO7g0L7imuMsWa2yQ0EfFHKR/e/QHhlQ1YPS+hNeMnhHAaRcY
 VGPH/5t32jZWbDdL1hmJgCoizd1E7iQ=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adbfd64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX6FOxVCyzedlv
 PIDrVmocLUa52FOzzXKf19P+zWVNDc/D66yXt744j8pUDpaF1T83AR+Ny5HBE5DEgtxCvRGaUv3
 6jXVzwb8a5J6kqI5s8v9YMIHijZ0P1lTOtAJjyIS42ROa4biFlAUvPIARxIrt9O6Oarcqwb1rAw
 zNXOIwlFgN2/tKee09sEVAiXuW2V+KCNNMp6uIKyvmUuWEX7s7fMxS7bZKn26XkxCojJ98k5RAs
 2n/2lp0/SeZVm9vSFsg+X7GtwUwv3xwzxerGOImsUMaxqncRYLw/S/DzDOiwA7kn3+RssYdXLiH
 yRNmWTJGfGIEcDvBCr1jn1z6webpxB6tjAtF6RGHeUxitv/+XKRlbu2Nv3S3jN0J5blLHCDxZjg
 ytzCe3iWsuebeV2g0+kQyzz6KWHcUUe9yOekOc6bz/GpkmXYQieM9Oyb9gcuEPyBM7MOhwX2OPT
 8fYErYWaLs/+u8zZ/IQ==
X-Proofpoint-GUID: -B4bg5relyCvSoEA__Ke-qHfgEIq19IG
X-Proofpoint-ORIG-GUID: -B4bg5relyCvSoEA__Ke-qHfgEIq19IG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required. Bridge core is converted in the
next step.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..898273f60cf6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -155,7 +156,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -164,7 +166,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -172,16 +174,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -301,7 +304,7 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3c8181df6bd..90e27d0b165c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3847,7 +3847,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..911c3b269279 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6760,7 +6760,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4f65c97a89ae..39814f10fcd4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1974,7 +1974,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

