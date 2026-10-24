Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EEF606A327
	for <intel-gfx@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTS1hJqX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UlyvqOWN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D26F112D5F;
	Sat, 24 Oct 2026 00:35:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E18112D46
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:35:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NLvIMJ297468
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=KTS1hJqX0JA+t+Xe
 BRgpxgNRIrxU1ob9bqwpQIrd7Heyp8U5wSPKQEwmhmPfxgaLe26ebU0vTRz8sAZF
 fA1fEDBwMfdQoYmPDhP/4ja/0AQDQasuKasWAnRBrulwRP4rRIzrn0P/6aKrMGKc
 fEIi3nbo4iNHHL3wOdNgEe/t2uEDJsTlBTruqoJqwHPuja2+luriq0F+hMsKOuUl
 ldem8LsDoRJfwY+I87BH20IRBUNyBd1/nmi0yQ8+3QIBXMoUTxy9GMLK7v8efp/D
 xyXriPRqx2ds5pteyrcBd2Hx2x4qA83hcpm+xJ/OxMBxgq1BTdEkcDMgEDq3L6yd
 85X00Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhh8j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:35:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cb93c874bso458500585a.0
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 17:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792802141; x=1793406941;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
 b=UlyvqOWNtTZd6VOWBZPM50Rj6B7kWaepbxHfcdPUbYFoOftPhVOWQr5Ea01rTlKnx8
 mB8u2q1NhB9xAj2Wh9/vBHDBs57j60SKjXBCYMbXsHwoZ0gecykly2mi3ljYMP29vQ/n
 uG7Q/oYNrkmmDGOGyEF7HSAibt/p0w50n5ps27Nd+bjyjSp9O1pRgswGlPsS4D/+w+xM
 W4bR/Zv/hAKStuZ9suv70EEZ33f2oVLP+fPWZ+6P18lmrvHYX1mh/3eDwptrRAva+2JG
 KRPzmB/Fm6k6Eve/uuiXy3XTDs2kazuLpX+5RhOJp/xZYhFwtABRy0pkbQKd267irThO
 4Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792802141; x=1793406941;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
 b=lrpk47jPRw7qLhD7RWu0oMPmm62UMxofgt3mu2O1Xg5Je6AQG1chqfJEBW3BYPxmBH
 nSHRB+wM5OehJWeCmWAFQ6gdbfGuW7f/FDbMIxIAylPsjO/ZwGjCzbseOIaLaN2E8qqV
 LQXyka3Eae7t3qYJzGVrr912d/yPagXQkQSooolDStBXOiBU4RxjzpJFKxrC0KR+gj5R
 OnvaRJ8VX+ThoHGhggq7dpjNbgQxblf5M5Wy5Cc5Ir/QMh/jXG+otWeewHQ7L4ZdjVXs
 R2ieITDItTOBvZLQvO8v/f8aogVkhDn+LYSr/orcQBpBGH/mfDH+TUkgrZQ/+jyTTQ8N
 5TQw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFWqIciXNpYk5IYRiakPkpNAqJRXkABDi/qqCkgKp30B2GkvyYKj/HJcPQHjWthrk6ohzKyYsW9n0=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJhEJalx2xcFcCBKsuEQHQ8nmGo5/jT4riXL9T1Q9Z/35u4Ep7W
 XBA95aw2rzahk2mzb6a/0QmxBw+nC6OeTg3pcG03o5S4k4aXwXmqPYx/KnXexJLdxKe8w9YMzWb
 ydyH8ZDtnYCC8LiqSYWA3ysYLNty7VJl8KHQNnymtDjRuLXqJsWf8dTCAure7+UOJeNGKlTs=
X-Gm-Gg: AYBFou11oSZIAtC+Q68/xqDlkxOwCwd2iM7vdq969i60KSJf2tnR2vvdfTylnPYxhAQ
 sA0L54K8Qi7asByA24F/Iv60cmgbMKpDpx8iYJRPFCIVHrk5ZAxAEIS5zQHKXgv+TmpEkDh3XkV
 adLoNbwNWqBs/APTzufD0K2XywtniawfYd6wGGKzP8z1cKwrZUw4qOTcNZ0+LukaAANTOqey7zu
 fgYCKd5F0rO0q6MMQFlukTFoNBmBCMZVeY+aYk/iPfCu1J4qAdqbAz/9H8+wI7vwOVHrX7KJqN2
 z/FrgT4qMD+E4p7Up7MgqhHj8Nc6oEqFzgFiJwdBAGhokurSiddCnTEoGk60JKwpoB15LqFnMWe
 b5wRMCntN71ilKwajF4otag7FIlqEcTqYrWpqcXRhdvUFLH4Or/313+DbwnATLGtAphqFPNWYUA
 wbgEfKqs9KZt7g
X-Received: by 2002:a05:620a:640e:b0:93f:4498:603a with SMTP id
 af79cd13be357-940ef9c6529mr87938785a.35.1792802141185; 
 Fri, 23 Oct 2026 17:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:640e:b0:93f:4498:603a with SMTP id
 af79cd13be357-940ef9c6529mr87936385a.35.1792802140729; 
 Fri, 23 Oct 2026 17:35:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 17:35:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:17 +0300
Subject: [PATCH v8 1/9] drm/connector: report out-of-band IRQ_HPD events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-1-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=saKTuWGNmEwpJovWRzupqEzCaC/rm4ThXYLAzUmpGxA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1OZLtxTLAZE9k4mLMRNIgX161lmxb4HdRk0
 KcJoRJVqumJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9TgAKCRCLPIo+Aiko
 1QfdCACr3U9nCjMaq7hUKcOJFW/lwp+QSFlq+SJzJzYEC0uF+7jmehgYxVVCZD0duk0mql8OUOX
 LEGEF21qooKYJ/ETJrLR8Ri8OqLRF5V6MD2geevo0idGhk8fqsh4rFCv2r9gTycRlFHIrA801XI
 1FViiDW0PEet36tSpbgNjsyvrBrRd4KGtMixDGBl+IWnsOHtjKqaF90KcXAfBzQAdMS4Y42bVDa
 ixdEW+I1ZmP0dGWunCuRWLcCMm3WJKiiS4plIQNIeTdoBvsXjNXQ5/jUu8GgxAf+gjCwpxWOzdf
 0gNslwwifuonvwbCN0OAdBOePzurGxT1myve6bhIuaze/Uta
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX5sGZg6ragvKz
 yYvGuQVOSwRP1B8lsGgARDDOVzVLFZZQptxSh6pNALHD5ISZrfO+melk8vZeqVyfPOUyNahB+Kg
 OFkun4HHo+sHKYIDi8vLve6hYU+yQA8=
X-Proofpoint-GUID: 8ruksPS0pCzffLMIqMlYHKHyVPypyE24
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbfd5d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=IejCAnqV6A546-KFDggA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8ruksPS0pCzffLMIqMlYHKHyVPypyE24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX9p6yEvK2e38M
 1GAgoMLTj0KSPgsyJtVtzrU8OI7acckJzQK0ZF4qhrEw/cHKGCawXXSfFEiBgv7pR3VCf+lLqHX
 iE3pQ9UKqyRH0F3dKSUgTTNvnWI4D2EmwtBUXwPfUUu0u3GKKU3zxxnoZxhuEagiTV6i89ODQWb
 If3hd2q9KxY+6xqdMzSQOF2rp+O39QJr3sejcuhu/aAyMnqUMiRqyQJhHbJJ46zj2P5zX5gB70c
 oWCMRLRJ/Hk/s+/7cnCtCh+Zlede+Sp59QkGU79MyuKtBeY07dKNZ5Jxl1waHLnCgeBKsTUzafn
 SfaJncoWTgDfGX92Z5kdxoNAVUjGsWH2QLugq0kpefexOhAxfpeZUNzOrIQdbV1QdGmjEIq8jlK
 1BSr95blL+ZFtubT7flda3K4hiE0wIUnySaxkkDuabsWwEEfiebWEFC/j6w0zmYL/sYhvGiuZS3
 bPrFWHBKN85JUl/imRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
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

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are reported through the bits in the AltMode VDOs.

Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
and extend its interface to report IRQ events to the DisplayPort Sink
drivers.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
 drivers/usb/typec/altmodes/displayport.c | 25 ++++++++++++++++---------
 include/drm/drm_connector.h              | 21 +++++++++++++++++++--
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..e3c8181df6bd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3821,20 +3821,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 }
 
 /**
- * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @event: additional event reported by the sink without changing the HPD state
+ * (or in addition to such a change).
  *
- * On some hardware a hotplug event notification may come from outside the display
- * driver / device. An example of this is some USB Type-C setups where the hardware
- * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
- * status bit to the GPU's DP HPD pin.
+ * In some cases when DisplayPort signals are being routed through the USB
+ * Type-C port the hotplug event notifications come from outside of the display
+ * driver / device. In this case hardware muxes the DisplayPort data and
+ * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
+ * pin.
  *
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector;
 
@@ -3847,7 +3851,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 
 	drm_connector_put(connector);
 }
-EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+EXPORT_SYMBOL(drm_connector_dp_oob_status);
 
 /**
  * drm_connector_get_color_format - Return connector color format of @conn_state
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 51c92dd887ab..2106074417d6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -187,9 +187,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    hpd ? connector_status_connected :
+						  connector_status_disconnected,
+					    (hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+							       DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -211,8 +213,11 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -396,8 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
-				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+				drm_connector_dp_oob_status(dp->connector_fwnode,
+							    connector_status_disconnected,
+							    DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -844,8 +850,9 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	typec_altmode_put_plug(dp->plug_prime);
 
 	if (dp->connector_fwnode) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_disconnected,
+					    DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..4f65c97a89ae 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -92,6 +92,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_dp_event - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_dp_event {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2848,8 +2864,9 @@ drm_connector_hdmi_scrambler_supported(const struct drm_connector *connector)
 		connector->hdmi.funcs->supported_hdmi_ver >= HDMI_VERSION_2_0;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
 enum drm_connector_color_format
 drm_connector_get_color_format(const struct drm_connector_state *conn_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);

-- 
2.47.3

