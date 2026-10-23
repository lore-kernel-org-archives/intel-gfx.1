Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BEC606A328
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zg3PiU9q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KLrYBgFe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CC3112B4C;
	Fri, 23 Oct 2026 13:41:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198F0112B31
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:18 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NAAKVa1597400
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=Zg3PiU9qK0tppPun
 NsspjomwNbA7Q3M2FEW8bViXiyhEwTBhewpJU1QOtdz/9Vq6N/xGDk179SBHhGYd
 z2b7OXKyxKFr9eY6lud2eagqwV7Pyq0x8dsik6CzOszsefGpWji4GLyWZgKJRJV+
 KisIhC+SwX63a/RXDx8Y2wdc06OSUXRopsrK5KdjEjtMBXIcojsdDwayUhphPCj1
 7Rp/YEUHPVgMXRxH/HoXb/RnRewYY31lJnnoUm7N6C2n3evmS+7VZ+K0BORCjalS
 VLG+hirHdGSM7O56TQcyyk7zdj6WSM0NLNPJ0qkux8AYn6kGpQZVVS+ZNvyJPext
 rUYD4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vkh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f3969a2a7so151440885a.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792762817; x=1793367617;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
 b=KLrYBgFeSok2RK1Z4S8f4RJwivL2LnSEIngoRGDpUPwIQQ56sZcSeAuNoLlGRhv9+L
 iPRssS19peOqW4VolIPGtl954Vl3rvhr8GGO6jK2cPgEYe3ugW1IH0Co/hSsDMZKvjvX
 45wglDovp1kLM9bqx92dpZdPaTbV/8INIFm4wgHp0QqWaZKpwmu4vb48iJVoHIy5O8az
 tSHrRc3EiCZC4fH44Uvr2/+jdbbQ3yhZHPTWxgPZDroPDwLVJFWr1X6XHyXiiv8oP57Q
 Dc17XvsGmVlYDb7sxtPg+zOsp+ivLjfdAxn7yQEYvFFb4IJbVNvNkwy/GSIY3PC4trNk
 ADSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792762817; x=1793367617;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
 b=TPum/9WNAY9i3gq5C7dZIpyLruNZ5hblyMaN6mb1ocCVY+cPLX3oBFHhqkrpaVQ/ep
 PNwTLspzLiN7lxJj8PximbohMBXesbDtA3nC5sudvQk88+3/iTy4UJgk2bUY0JI0zbeu
 8OE7EF2Hy8Tq7MuQkUT5Fmfcrrcfrd+1Cx9o905dWVYb7XendTBJfAt+ALisiV07JiWu
 LsKFehQ89yhJEdo3z0bVurb6p7KEp9fE0N4QFQGqhxOOa7Xxm2fJjCZkE1WkeTLpRbwd
 SCJ/bgu0eSSGFaCpsZGvjIk8rOFMJjH6hgrCZt8uV7fzXx2ZuUmVu0QDp8tSLmU00bKS
 AuOA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWUNi1EM1V9NdS8cok/K7jjlRA0oQAZOLSeYcvUf7bGCFDSDW6+06Zs0PVeTSGwFUopetTQ6RH55E=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYI/JMn/v308H2bSW1Ljhk7FVIx0Kejr3pe3YyQ74ni+q5HhYky6
 CKs7Ehp7rlx4WYCTEeclTqll7bP4v+SahJDNTZlk/JpcG07pUgpX2EpnXlZ4nK36ZRfJ7aj0dEL
 VjyqmEkfBLtm05DuwrhK+1tfuc/8+Eo/VEMTtSyVTIZwLdJNPqCxON/hexsY+VfKeKXJ1EO4=
X-Gm-Gg: AYBFou3ZAoGLPdUakssZ1TSOdJjJxtYqBMxya7diWdqaxGDgMqhZwFPgEfh0gD7Z5T+
 6mqRUIzu/c8vA1YOblJoYw/Aqx/zvR2+U7yVyiHMW3tUN3Md99W7ZN/5/MU01ZDG3rDlTLwtaby
 pmzegko84ZBKEb5QrwihajDkqu62kqlPq360QxNjt7d1harg0gLpvnCtcPlL6i6kO1Xnkfw07qF
 L9Ym4qH206glC0n/g+7Fg0HR/bznly31EUdciJBvEeHyIOsZLLUUxnfe70LcPaLD7tugNiAjOu+
 fhbXPuvKBzS10vOfzwzFuXEETuVMV/f/7SrPhsbB0jPokXn9uaicLDKlcENyGYslKEGuCWUUAXb
 OKEfoX0Ax37EMBeWUt9TOWeLklooPAQiwNfTFTbiBu9bGV6/Gae0LWSPhNPDMY3CZHwTgQ0NmKP
 76VGUcq8Z8k+8n
X-Received: by 2002:a05:620a:470a:b0:93f:2d10:ea49 with SMTP id
 af79cd13be357-93f6f8151d0mr410842785a.45.1792762816452; 
 Fri, 23 Oct 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:93f:2d10:ea49 with SMTP id
 af79cd13be357-93f6f8151d0mr410834785a.45.1792762815720; 
 Fri, 23 Oct 2026 06:40:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:40:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:42 +0300
Subject: [PATCH v7 2/9] drm/connector: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-2-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22Om//UNyL0fPhmHrD6nuKbi2vX3GDx0s1bTr
 hXsC6vJjfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpgAKCRCLPIo+Aiko
 1ZdYCACfUyt4MtbHR6/ige4IwYp4trmZXbGoAwMtHMMD/UUH5j+5B7lEYrOMjoRsyPM/XHGlOKd
 KrJ66djgMsBcMB7IPANZGY3FqaAwnvTYLklmj7WnOPSgu3roa0DyVJDTf9hG0yTfv5GKiDbQ8Pl
 KmhArrUvjAOC6NlZmE37M1IGxwF02butanpr3L5qsTjcuO3s71a6a/npS6k80fLUVrGMEYea2QV
 NWGFdXw/NUM92MRh8HK3KyD860qCSA+GJ+WtCnFR6Hy2D4nls1AdzWrq+d9Ww6UPkZMgFO7FyA3
 3SVzSOu0HVBdTqlWc59ycZoxM9LHd/p4JO2Ovjobd6LGAZ3h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXxxSa1tKtkVKu
 MQ6kPSSruT7QUGRvHdWBxrVe47E0e3LdO4OMu/nflXrVjLG09lr29dTx2b1j7BvhBpG4svdMamd
 s5rX8sG09FqxaHur/j4gYQ0omBGQmdnviqLSnSZ5hHad3Zm+UE1IDbZqKzUSuvLV87zANRgCXi1
 0zgFaDs8fTkQFRxR54i2E6IYBJbDrdQpSqtRcLTXXW+isLKqHxuzBf9BUUAxtOfGtXPMqc+vBfn
 dUz0rDLzVjdHHQgIG6Zj7JVsLWFNBQyR6uOuzo9b+Cu0wHKEYIHup09cPSKeW7oEfZDK2Xx6bpt
 YCKjw/saatoV/kzjVYq+/mSZaKM3NUa+i4MsJkf0USTB3rcJiWuyuL81b5Ye32fkN1egciGzgCf
 Z5SP9AYNPsbKU1tPwib1G9VmYo/e7tvCr2NzQ3pyz/o884GaHf3cGAktB6WMMpBUku/O48Swaks
 m5mtAgptJnCvXlF38Kw==
X-Proofpoint-GUID: HUcNWtSDlt-hBmRSIueUa_OQd0YlrCVE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXySQtZLn1d8ev
 EnqqVK09QYdWKdpghmBhmguk07SlQIHMV/7TMLHWL+NdoafOGfacOD8crUARWVhDeCmRioOR6wh
 ZcUVDbVxvo8hbetoKfizXFfbFDIsHQY=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HUcNWtSDlt-hBmRSIueUa_OQd0YlrCVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053
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

