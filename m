Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E229606A32E
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofnf6ZU/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fXT7Y/v/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2856D11264B;
	Thu, 22 Oct 2026 13:28:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D11E112629
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA0Z623923272
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=; b=ofnf6ZU/q+kO7QhM
 Y4uarySkWnJOT1Mqh3oJNhtOMdkKTrz+Rysgd/jHT0IQewcoEScmN+WIcMumic87
 xv1YbMdjPmXvjfNwjGfPw2WYo5kLyAvSN8/Vt/xa/bqk7Lj41mx9Vg4eEtI4KFxZ
 jsBKnXDzgCMGk8egcNXgwE91XT+GqKGhInf1TTvDyHsHrc46uD14KNIgt98rd0yk
 Sl3u8l3gOIJH8vsM+BbMWaJOljmiYdArFkdNkQfRbf43Zuhm/7N5u6LlX9TGpJAK
 zfmHxDvDrTudHXozSmGX0ekFdX/dczwAXi0nm5GtNY8w17YQiCqHT6446p6Z1xgk
 +SIoog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bkqq8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f2373e9b4so215573985a.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675704; x=1793280504;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=;
 b=fXT7Y/v/A8N9zPJ3wixwaQSZbmD3GCQuW81wiZwLrXN6e3i9iswO4MYr0M9h9Te/go
 ZQP3TaQ54Vz88u81fPTZMb4CF3uhDLn0keYUtfOgsddIaedsVNJ6yV4ltXAmYxOg4l8O
 RcpieVGd9u3WLUn0Yuu3JJWxH3pL8Kn35O7/ZJ0WEB8lPtahWcRPVj5u/ZIuV0ve01jb
 Ph5zS9BidlgMN5en8qRCBpF7AQEKKrDXdqdyLiQzBvww0xiriHRDwIGOapAUgiqzZv0C
 ZSwzag8sOEo24uU91IRpRdHTecNTfRsc3nWz/nS49IdYZJE2NFCwmTJ4Lvy6+JpO6xRz
 cIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675704; x=1793280504;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pVFcTsw7nDsd2D3WrnzVxWA8UM6MmAK5PteqqT4jhjc=;
 b=BSUv++BEvBQ0PkNxh1jhuIZLRjlofpAAnH2ZdPk1s8ObiBJscvZu30cCZLjai03eRF
 U3a6pXpNt0RnneIDSOwWvAGDpHdOtKZXtNly7dX62ASxvWsF9TrUXm2SjCK1WSV0byIE
 9BSSR5eqPhdeMJgyd7WgRSRjjpZO18/25Pm0FzPU50LKqMZHH2sIdNh+IDL3lzone92I
 tYi7a5qBvTjf9VZgOfMC8H3/4Z/3HNBp1YnKY4yQGdeqfV565njkkciaspPNXswTEDGC
 fjb/6RX3UEYFy29bUTK4GsEmo6iWopvvi0lHw89xHFEcAu3u/HYJtl4e6oYTwdB0YVbR
 5Giw==
X-Forwarded-Encrypted: i=1;
 AKwUvByDJN1bd8gla11ciMfMvZ00q3IQjwnYcfFa2x3nGSH13UI7YH8OYZQuBytBaDa4i2xrNsch1IeTGQU=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJtRRO8SVGbI+IqCrMujlQzNhluC/jdmq0JGOi8JEHF88b+36K8
 AtXC/Pv2o1IYZ/rayFC37iERHdsZ8JES5ar0dsB1A/aCZHHWzR5VEqS8eTIwRofV11gJm1P+1md
 6iTv2ijcFL4ksWkf59S8Ng/QcPNStOfHmyt+e2yZJ2WPFQ/KN05h6aS76BF2zAHb0Ut3FGw8=
X-Gm-Gg: AYBFou0aA08Z7jict5h6EIz4DZIZaSWg7x8jlyIoLEtjV+F6FyLf8VcD4clMQOPGB6D
 xzv+VAPl+ODHpwjbfnE8fC1ciis3DEsFRkjwKOM/W9RhejBKewgwxDR7JAGiNmjk0jo4005k8U0
 29R2MpyZeMhclJreWejHAKzjKAlspblBXwoH56cY2lMo/V/cJ+Tqnb8G4IKgWOEuILLGEoLT4qF
 kYaNJjjqKDZhC8zLzNvvBtgR7EhPvBFJwhWBooKlsp5qCNsa7Ybv7n/qc6Mkpw7izkxNY8VVyA0
 9CPlVGwd2VT/e2WufSP1pRCSP6c2R0IZcgpQOApmjHDq8z7iuwm/njd2JprkbMcn0NUoyH+8qGP
 P4Ncn1Ob2un/swuU7mSGxDGozCYeh/7wn8p8GAubM/0ccfc/NaAA554HtzUELNWtlRlkO3Q6tH2
 0FtJZUB2Mt7L8a
X-Received: by 2002:a05:620a:470a:b0:93e:7944:b874 with SMTP id
 af79cd13be357-93f57f7a4ddmr850929885a.33.1792675703563; 
 Thu, 22 Oct 2026 06:28:23 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:93e:7944:b874 with SMTP id
 af79cd13be357-93f57f7a4ddmr850923585a.33.1792675703003; 
 Thu, 22 Oct 2026 06:28:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:28:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:58 +0300
Subject: [PATCH v6 3/9] drm/bridge: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yTxN63iE5sDPxbwfRJoSoPuKPuQmAYz4uarpJlGhNeo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9l4JDgs3YT7fQflKbBludBM/COk1KjL1Nyw
 46WbgfsPRGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZQAKCRCLPIo+Aiko
 1Qx4B/9t2GhDJJTG+ELCwLIBsJRfXXRrdykplLp0v3ucrwWGUnxGvJldg80uKgm/+dha3ocW2yw
 QuCaNpwKhNVZpuIlfZqHWU0hAMkBFVxCme4I4kAh7GVsYrfoT6NhSm3K/MHE6pHwuc3+U/Tn44y
 bw9t+GVAqiVcJHy5dEntyJrwXFcjaqSeXbZckhqOE0UChjsMt5mH1pjH9huvrQ7McXEMnfsgyeh
 cJHIyJ9E0QX4rb+uXdhFUG60Qluqd8k7voEkbUf76YoZ5YYme+jrjVHBHHiB5PkoQPTh5p6RuYf
 4lmnxB2WsHIX13NJrfEf8Z4mdwaLlWvITclM+uzWN1TNa5ZH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXzHyNr18YR5mE
 YZYdZnl2trGqgEj66d2awhe7q6DQ8bk4JmQ5h4R9rbTNEVgqxFGlC31tKuQwZTCfbS71dgYfqlk
 BnxYWqnc9h5DFethKoTVxT4v+i3nYk9Ld0l9bEoEJOfyw6HB576OlmkEm6KaulKnAzn9d4kyONo
 z5aYJ/ZQQmj7JNNGUkwWpC+xEl3G3lh24PFun8MTom/F/zrh7b/HtdXZMwU3hMFbOG5oi6+SBAW
 RcoznHbgQFIcCOlETFvcEexWY8W3TGxJsvgyioywobtTy1eqHOC4pRE/Gf0Rokv9cpM/xh57ZdR
 WR933s0G3t5yAUYnABDAwi5XkFe2k+lT0s0fjbYETX2u+afgTY8YWa/tQ9qVYr1JaQvA7JHaFgJ
 I8QirdW1JnsZo0hDG+vw/zqLfWVXqA==
X-Proofpoint-GUID: yOjdSejxCb1h5YP3VA_SwR7vbn6XpamE
X-Proofpoint-ORIG-GUID: yOjdSejxCb1h5YP3VA_SwR7vbn6XpamE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX2ivpF37OwX3J
 f1TQTzaw+P+zSDh5vDfmPToEo2PQ518CG1xxOEatIr1vGTBIJ1P7Upgqr2FpeGIQ6lTFZIDP5E8
 8f2Gsc8Ab5WCqp/zpANNAv9eCcEhJv0=
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ada0f78 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053
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
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 898273f60cf6..1b0a1a00d8eb 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -151,7 +151,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6abe30bdff12..fa8942922b53 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1541,7 +1541,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index bd6c4d2dcdc8..72972a6fe989 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..6382ef5f1ea2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3

