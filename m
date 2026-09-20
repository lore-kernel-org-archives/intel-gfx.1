Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72ECC982F2
	for <intel-gfx@archiver.kernel.org>; Sun, 20 Sep 2026 15:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8BF10E279;
	Sun, 20 Sep 2026 15:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXC/ueKz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdV0Bj8q";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB6510E5D6
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68KEu2TE3817105
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=; b=DXC/ueKzIq/kzAF9
 rFYqtVTFD/hrOYA2YzaXtLkcnUoXM2sFtzvQtwmd/9/ZSZ6Y/3CFQ8sg9RUnOeiZ
 RFVYdj9zMPsAnhI8p9o0mGPf/Wjr70Pl3ScG0L/EVdMNh78/beTatZcT9xf7ZxHd
 yD4hZW/OZLFu8g4dTZs5GmNjUuiDIqK+mWMecon6ao0P+rvaBAPtwiXz0wzLzBsU
 EthYaBSLNRtrODbJ8MFm/30Yo8KRbDC+8YVsY6Yr1m8vDa1DCBDIAx+ZhiYd9mwY
 rN3XRbVxjKOVnk8EYpA0uXNwGP3mMuf+mfD9AGoK5uhIrsAwuuf5AHCBxIbAp0Hv
 R5evsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsg3f3j0f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:01:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52dcf1bb6e9so68173261cf.1
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789916507; x=1790521307;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
 b=bdV0Bj8qIkANNVPc7oOJVA83vq72JmRavPC7jGCVN82dRI7r+t/UUTHYW52O3r75SG
 C80pfTJJHY1r2xK217a6ECokNUCo8eXGp3rlhYYMb1yoJVoSkOh3MWnBnM3WxaAGfUeX
 R+l2zrYpVsfq4EXQ/EcHG8D30+PbaAGcFyTeB2QT/bj+ImqQgglQZDeRLezrqOBZZ7Tm
 /Kv5/ZBINeQbYK8lYc6M0eDW7ehBUk3pbXm/WbiQuAW5NMa/yt7dl178FK2A4xYXabm2
 XEEX0AFSmh7mnxohgyNaT++9SxaKJYZKukwHsLkESDREVDNmEhmkQDid11A7cS2mtH6s
 3NMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789916507; x=1790521307;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aOWTHqgvLuy0XmuZ/1jpl1RxxCGjcsKJP2g9nf1p8m8=;
 b=AeXsyDMynMTEvtgnZ3ig7lrOqTvFuFauN/WLQin2ikICPDr4onN2fNN+m7HrT5smHy
 LJZ2L44XkauQHE5QtG8eeKenX3e5Ebef6OJuHxpnxCOqzkEYBTPn3a/z9AMbzjbTSAw2
 fJUMBQDjWr3XulXwt5HB73zX+2Hc+XOYiLKoUZ0wVDLQQrFJ6rFhU8l556jaSThd2nE9
 71/8FFzv3NAfSyGdpHrhXTod8Pi4PrJVSGSIG3CFLx4G20S83JQyST9lrPUblf8nogNE
 q/8rgkpVbKyCjy7sxoxGhWNlNrc5NnMiy6HjRzes2MN8AHYiB8cr/k39xY585xCidCmL
 qJTw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwVGLxkeK/hQ2tAezB8B3Hvl3vNG0tcBAGaJSWyn8RLt6/aXZ+ljBLFKdkLcXRzSp1z9jr/gExQdc4=@lists.freedesktop.org
X-Gm-Message-State: AFuF++m9K7ZTSoWef8sooCG8/IT5qFjfuFRz9qHjRVcihxHUVl6z8B7k
 UumUFVJJmypmYnm1JI8Gp+T5ao4e/EdTaPmjVHh9vxBSHqfwZKFID2cT7V8mfmG+ChpQn01v3wf
 o2p56c4ELpffnFk5WoAc+bFMr0FP4SxoIhpYyAXodmrzCNF1PqvPzt2o+/ij7vpaMK7hmXDk=
X-Gm-Gg: AYBFou3JXZ2Qxnpba0Hr86ee9d32iUpmptFwo4J3WCdhlLt9539iTLjTIOkWaYpsRHz
 KtvHHCB3VcK5NJ9cdiqizPXjpe8z9xVg3HMO6jwsd0R07ubt/VUraL0bfe2u8ett7Zd0F++9RxK
 AgtC4Am9+YW3mJ+gjJx/L619ifSXBSGW5CmrlC44DanuuCXwkWjqpAEc72MByEz+mkQtYl7jmxM
 9Vf/jGzL5s9D+evu3tTuY/kO8Sh8ZKeEi3LyB5eMliD1Dta+PYgBCO9GZG8L4iqpvbDB3gy9242
 Vbr84r9tALxoL0sfL1mR7UhnTZia98iZGNPg5OAAME+WgOzE0ThYR0KRNF6CKNH9YvJpgoeUb4H
 p0it45OaR2zxJ3zrhwspli0YVafIxKz8A3zENQVuleOCF/QOBV2PjLWtDXg4g0cFH93kEHvLqGQ
 YV/RfWPKuB91Ht
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id
 d75a77b69052e-532b6f9c339mr59088341cf.0.1789916507143; 
 Sun, 20 Sep 2026 08:01:47 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:531:10c:a525 with SMTP id
 d75a77b69052e-532b6f9c339mr59087721cf.0.1789916506618; 
 Sun, 20 Sep 2026 08:01:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:31 +0300
Subject: [PATCH v5 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-6-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IHP/CEHKbEjbTAclh8cTAdfCEyItA+qP7FeirdUUoOg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VITghi4UzzRoE/FzgfbEnUTmORHJmboGa52
 XVMK6F5wo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1Sv7B/0YL5DFJ/q87OBtIjQCInHBNjJWVturTDYh0TaYHFvNJxrU6AlpJU7OUMxKsZfCeqyUQTp
 CLdTznZPfsk0pHv4sgAH3ivr8voWJgY0gF9WW1EDhy+P4p+MTBHcM6fSGNNsIxaGRc7ZDzEWqYJ
 ZrusLtSE1bZYR78wlMziU9RHUX5W7lZPN+sZ/zgMF3FdhkI5Rg4LVp8wHKA3aQLQ4QWGBQ9y2yu
 PfH+vAfW7MsNUXcAVZ0L3QCDqaZCQ5D86IfEyPSfSumHYKRgKikqjEy9a27zrbpMhb99EoIaIMA
 533IC393BTUb0jdbU8nuR0DF7Xsw2gXSG4kvX3t3JpEU/nx/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX8jOsXdUMCB3W
 JmrkXjtQkQSIYhoIcNj5M5Y2IXejKIuq8obvJtQ7XLAImvqD82wzYcDKXIMgv4rj6E4od1iOnkp
 jf0UkLvZrGvtdVp3Nf7pYUznZEDx17Y=
X-Proofpoint-ORIG-GUID: Br6thTxJCQ5EA5r0jmFtQ9LvZbU1uPFW
X-Proofpoint-GUID: Br6thTxJCQ5EA5r0jmFtQ9LvZbU1uPFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX0KCIjQWGebQt
 tFqXL6dsdan9z5XwQES/Zb+4eC+Fbt3Cd0KfTzfeHx88VB24RxbcbCBPuc/2GRr1fOaunANnoi+
 qWcJNP2t6/UZRB+ko8dmL5Qbah0Ax97U1Xx2jtHNaPIrB19oduHNUFSVNhAyftdBYy6t4OdvkaY
 R16e6ZNei2WBzOKZx1/8g1K2r8Do/ZajC9pNYlhD/JpsRcburXMVXg5BJZYbxfCp1PIit24DO8m
 RIgG01u+GW4F9cjG/UopoIqkFxkRhK9IHUwQX4aaZ//xdy8czkvYLuNnMOha3u8IWFGht7dBD7j
 SNdzlyMmrXt6HYu1T/A7EAHbZgArnncOgBBo4807tQNWHdPXVyiOohlIsP+kySDnkzANyp2WDbQ
 2BPKZhmSr8DGj9a4RpyargxHVTBiPrBK3/qZgbb5AbGOM8hzlpzr/lHFbm/9ZyUGxjlg/BUD23J
 Am+RYnlsOIqCrOx9TPg==
X-Authority-Analysis: v=2.4 cv=N6S8hG9B c=1 sm=1 tr=0 ts=6aaff55c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200219
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9308e373447c..a420e3d49928 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1559,11 +1559,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
+		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}

-- 
2.47.3

