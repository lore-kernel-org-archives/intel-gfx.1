Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AE8C982D8
	for <intel-gfx@archiver.kernel.org>; Sun, 20 Sep 2026 15:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ECB10E2CC;
	Sun, 20 Sep 2026 15:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tc3H3Mhj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ixk4+Wl6";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A6D10E291
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:03:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68KBnpLI1761081
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=; b=Tc3H3MhjFhnblgJD
 SPNW+KTDOflRPaWcL2vLPAG7WqseeqmVAEBRj58+94rfWA1icLbM5/eDLWwI3vcX
 9swNh5fsoZC+3zlx5WDw7cIxzYqz8qoqpwAT6n0+1g1Ko3n0m+oYsJqEFnQTlUjY
 /Pd837l494hM/8LQecJxSwFZcVZWwz6Yg8YPdH6EWctRA+GQmpOM6TKm1iXSjokv
 lCvKpwfqTZfD3PtBhFWsNS6ANlRWxvrZZWwNB24DNR2SlEiVkKc9+HcbZs2XLznb
 ltoNsbnsIFVRysLBL9+qxrMR9s2vqkH6HbxOzxQYUA0x5QJof8KLgJ3x9crfOigq
 sXGFEQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5ek4ra-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:03:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7930cb5cd3aso1710221137.3
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789916588; x=1790521388;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=;
 b=Ixk4+Wl6UtdHTzsTrxmcN1Z1sr5s2ak2TVlX/HXA/c0MvApMUZ+qgbfDOckwvz/rUL
 6/0xy0XEEkq8tjslwpegFfaxNfeWMqbBbosp2by/86Eq8ktR+STgM064ccRieKmU8f1B
 kibS8yNmLU26NtYbsYF5/OUUjRAj9yaDQxvrRNxYL2HqQTOIBq/uYW4K/MhRV0ALckHh
 +0fEDx9JNQc0cDByhtBLIhUSGwfA1Mvocxhk0l6GtjJmaFFYBl7MXzLv0LCPQuzHA5xV
 irEL2nWQ9Ecnzt+izVG0WLDIzZZiUXhiwgSVDIPOZylofumJX5xlGb9aZwSgxnGLzrO1
 Q4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789916588; x=1790521388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=riY9eG3dz9cv+aMf8SNtiXHDGuMJEVW0ccQBcCjvHek=;
 b=F6V63lJeURRb6DsIaWEf3n+B/lBmfm5QiKlgrTeal+5o+yX6NouxexEQQP/CJh0RgZ
 ESYgXHW9xqJveFPQuYkeO2dO752aykpyO1xCaKLZ+NAfmCsB9F+wxSS7r60uj6yxO6RB
 UEfUDHYEW3oXiQwVsZmn7TZ0eaHM/9GZri2T7aZM/P77UwpIrp4+qYlzuE8vL1v12tD3
 WmsDsvWs/FeBJwKopSWa06R6dvdJwl1a5Z9ZResFpwr2AdNnSRoKBB83w1mxvx3vjVc5
 W3DtdevARtBx5YYC5fA3JS6kTbNXBBt8QkIGpJA3VoTyplpBBmia9ap6U0KsUlRqCqoL
 qqLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxxRfuYzy25GgtfHJdEpImjmxaIKCzsu9saRtgNsmumOYA6R4OwLJ0zNzsQjE+TQPMFTK2NI03Zb2g=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nEXSnj/9IOxBdbGOYwi8/wCsikHCQ6/TNLaCAHeV3xbyYx9snW
 e7YYHHdbZHCR26uKC7RJReblhgcW8MgZlwI/XHxVEWVe98Q+vpexgrfEW5By1rRuRiJUbDCDV7a
 2AgxSmJJOC574kLthuGC199dh0LpdojHYgwO5aEGK2sC3Kalf+qlVdMa2xuZy7ECV3Y1uLRE=
X-Gm-Gg: AYBFou1fJb2QeOeHATVFoXaVWsEJ+MKiFeUhNx5D4OjFPRGAzYbaGI3aJn1hASDH7Gd
 3AOBEudJrVAfwVySDczyGXI18iKH9tzMyAUUPQAXNjDGX8qzYfqwhVz1s7FK7BL+f5HO2XMM2eS
 7XdxPFrc927QyqACm2E9fUKq6v/Zyu5S2kWp3CYm4eTAZ1D5fvD0kX9OG4Y/0jC1mmPbIQL5KrX
 MKxCBtq4YnFkWmjVlLvUrOHhM+ed1ByXizcNrhw0Ap6vTmF3O3pGn7ebAaMv4OxqNc5+RSaPrF1
 zpJQyl3PqgQNiBWV7pYyZeHfMy3buVfR7YPE137jlRK3Uwbas+NnagX3pzRPbCtOAcyYGq05drY
 C8++GHzOkQCc0X37+6rWYD+lVLtCl/RhXLXEnLSpX7POz7uk0okIU9ydU7zMm0jcrf91ybhPM/N
 68PoGJq9bc39i5
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id
 ada2fe7eead31-7a55daa4aefmr3065620137.28.1789916534022; 
 Sun, 20 Sep 2026 08:02:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e823 with SMTP id
 ada2fe7eead31-7a55daa4aefmr3061758137.28.1789916509473; 
 Sun, 20 Sep 2026 08:01:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 08:01:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:32 +0300
Subject: [PATCH v5 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-7-ff1de0090c72@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y5prep+uK+TtAox//5HU+Am3tOMfG+jy1KYlpaBl7WM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9b6rx73FSI8L3M2/xHQ/9vYsClqvtqFDunnUQJ/PTexr
 Vv7aI1qJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmElTKwbD89sa9B+8KP2p6
 9qOlQ9erc85v7vgP/5qXta3VXDshTN3/Up7LDJtlL8+XKNV/nFwR31K7W5/D58kd6e+bZ24U8Jb
 /G8gmHewiJqL8jL2WrcxMS/Ti58O9Fx9eOvZPplTDuPleqNjUa5/TZJQEZBavPv7u8rZFan835h
 /JcWlYGCxxZsPZZd7B0s+tc1h1k7K3GWgw2Jy0vdfuc1v1WU2GiVlsj8TeLyc+1zUcza34H/tRP
 WV1X0m30rY5/Km1j/JT8r9yXFfKeHJNsP/illuvGRza3lV79FUZpr5cIl+oXZAv5rmqW7SdcWPD
 RKdOZ8X4PTNsYi4yZ3DdC+JJfxHRKpHnwxL5cnLz+sm7AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: V4R_HZnNkZVZ0d-bt4u04Asowt7V_oYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX1vy3Kb25O5uY
 a9bd1NqsTl6+ukpTuHBZ8P8c5lCVD8QMxQEILqKKBTlxKf9wCuspHgxk5hFpJcUhHxIlHvVJP0Q
 /nfd6aagwLZeSv2OrnWb+VzcppM6lsMYX9E9ip8Yv08cAFbWFc0LBtEaFH2WShHLS/oZqqvN+s7
 /1ZfF3dN9f/sVzwTCXHGH+HxY0999BlAzVCUhpFf9faUtMrcq+E3xxaTm0x7bjDgVd5QayvydnO
 93/PvcByummsVgWWBTsUovul5KtTMfYG3CNO1XFuN706uFgIEzuP0Qf99nPLFmrgNas3F49s8vk
 gXLHydGNRCrD0pY3K/ID4qTSS3uBPGkpn6qGfdzJ/EXsjwwBO3dGCJVhIiy88eLrKhOzLzEfxAJ
 38fw9T3/oWoKPW57gJeYNA/zpjKxncuG/tS6SzrfnUaTJbvojt/HCqrHrequjbXeec9w19v8oVv
 11QEZOs2YXk2tIUe/TA==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aaff5ad cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX2z7GsKe8ABwz
 +NrJNkPrQQ+7yhztS2OPG9leHaCIp+JbeevFUDZ+AUUTcZrRD1nYz8kml0lnZDFmRvhV2ftrzXK
 jOefUnjyZmpjXOQo/ZUiF70l4AL14fQ=
X-Proofpoint-ORIG-GUID: V4R_HZnNkZVZ0d-bt4u04Asowt7V_oYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219
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
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 465e5d2316a0..e903d4910e9c 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

