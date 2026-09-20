Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175DEC982E1
	for <intel-gfx@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8761C10E287;
	Sun, 20 Sep 2026 15:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyhU/NIf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6R5Pq1P";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423E510E22F
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68KBo7rg975657
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=LyhU/NIf6khqaz3X
 f2oMgJDFkUIx2VNz5QCZqmwTUJMGy1g2VGuy+Wa7qDxFAGlsE9RXPhiwx5BReQQj
 J8IcQf1B6LrThNm6c1DYOZCJZDP+hh5/P62LijFAbhdFvjHu27egGlxk/nf2Kyb6
 7NC0pAG1EDnjKuuY9+GxG+jDsCehoXoRSk4GGTDvCVjpMeJWckVMgxSHL0ZNj9nJ
 zmsoWAl3OS4X7vNRxGLbkmYVC5JcA4rpMJmhe0sdCQxhppVjQifaeLr78HIjAHXY
 y6zfaK08WIFaGiWEK8VCCsLoJzvHn0fOu2jsFZ22Qg+icvuZkh63AH5r5DvNlYhs
 AdYkuQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk33tg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 15:02:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-78a58df134aso563545137.2
 for <intel-gfx@lists.freedesktop.org>; Sun, 20 Sep 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789916561; x=1790521361;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
 b=X6R5Pq1PN8Vd+g340bkTcRJyvGl1cCQcWabcePAQpAPj+VTHgmgI0Ys41v6JOfRQv3
 YP/cEfnPZSTugGq1D+IFneCY0wG6UDBjo4aAp1b8gJTY0I+AnrRl6cZe1e7ptFlC4p4M
 zZUmIKMRBRwfag52ZDmpFCD29bGTg6ZF+sowrV2ju9v03fw4Y0wlw4kRrGHanCEoRM4t
 DBKhb9ipNIND3wT1ye8OyuP9smFy8XSUUhh94R5fBZ4qx6cl9JbFywSHnVtJ1GjqKpwY
 CTYHiVtkJz1bkZ38ES/A0nlf0wvYD7CirFO+viM4jpo1/CZXiX0go8sZhkGNFqjVUPEu
 /ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789916561; x=1790521361;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
 b=BqCeiOjY4yMfljQcTNm6bDG944WhXW9XgXSkhlqnBQBdVeJ/t8ATVot7hxqcqjpwkY
 f07yJLeAqXc/bQDWaMKM1zsGgmos9OWpodwH2Jvtxfk4YLLZdzZ49vsqV87sBmo/6c37
 bpuatZl8fRK1tRp8hL38X/LANESrmaAiNixxlnkDNqGh4Lnx0Rq6f9WIuBQTo+XZsrbN
 tTwWrNc/SBfAgDvvDQKRluoK6lvXos6qdikReWiya5m2qS+6N21Qlb0oaD+R+kwWVM+v
 GymiNT9OhD4B0TxkoOk0oyhUcr6zfa5MWToRRvBP4dseN1AOyuScQieSBH1lh9ncrYdF
 WNfw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxjOKXwH6/k6Az4KV8ejv9Gfr3yPWNk6N7caOO3jjhMPn3wfF6FKdyts45OyUSQRGbttPFSHkzeMw=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nIDW2NrKSu9sAuf/Ht00drRQAV5/gVnYxX1TPr4ybEhB9dTW6d
 D8+KfPgTd9m16Rl4sIbZKn4suAiXgH/VDvmR92/dOjHzSLo8axwPCT2IfIh5X3qhKEIRePYi1MF
 DOqoT2Hs2S3qQgCVaGn4dh/OgijMvuR/LmmdmVDlk30El/pOhFkJH6whhbPOAyZDZvjCqoZY=
X-Gm-Gg: AYBFou1D3u5+jbu+PujC0s/IPZhBH0sNvD+1mcFMQwyvRnafnkDJ5x2KSXwTTZClSe6
 7m+dpDVGqzdfZVg831tegtLeUSrDDg5ImIQO+5/ZocRwTBFKYho7PB8PA65aTVD2dc/kCrZdBW7
 b6jyHjlZCfkYkMJHpfa7TKBgP7RClUmLPzTmCqc67PLW1dPYlRVlm7aC4EY8gDUbK5BDnpOReuZ
 994niAbx1U+fFUFFMVIUIwy98RMww0F2RKv/8PJVwRN3L7aqSkiCHWIm7gKUJAlSdvenK0o/Pap
 mM1ZPsS9la1gZJRpB8GWttisniA08gSXCtu6R2aEgLn8iTeNWjHaGHiuPpdsKG5thgHEEoaczub
 zQeUORiXlKUJE0wiVgq0EGHEQJoixWwr8GwGMI8i5lqWeixYijD413cI3xF6IetJ97miO9kImqR
 DZl6ljHCVVEOUq
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id
 ada2fe7eead31-7a55ca8a2ffmr2385176137.20.1789916540428; 
 Sun, 20 Sep 2026 08:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id
 ada2fe7eead31-7a55ca8a2ffmr2383773137.20.1789916512407; 
 Sun, 20 Sep 2026 08:01:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 08:01:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:33 +0300
Subject: [PATCH v5 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-8-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VInUmy8zA1nzNuEwUoOY5JpzmI+vHj6DFGd
 p2t16GjXiyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1cByB/9kaXaz9ejico38hBPR/nrKnSJ2+GBGrC2HgOUCqVJYVBl+wD1iTcC0lJ1lI1rVVoFb7hl
 On3AdOhJDRB7INjnKzoO/CrkukNQF5hbG/cma2VXE4Wvc3IvWqmYsU2XXYzqzvF/P+iJeVE0Jf0
 EQp/vND7wTm9P84MwrqonVtf5jamrmZc3eVaT3GaV1v2rAkWRDCqWJlnB+G8FmTWc+B+ZxGGfhI
 v3WNe1aScNk+JZC43arleaguKrx55HU4VILKhUhERhcbTnG5cu20D9ZweEcwC/CL1hIBHoF3LdK
 iFd6uyPvdlFK5oHvM8QmmRcWseuO/xY+v5QAxeh6NfTfCBtw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaff591 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX3QjMb/LrRDm/
 hmqWf0S+Q0IjlnS0r8Narcp0No7uewn62naBTB+XdLKYMd1SEtIwaBlmNx0jUqnFFtUkJBZd2pm
 fPauECJrns3hqVZFvigKDjABQVcqBCTZH+B9oIPVCh8l9HSre+298rAke6tab0aqKkb2pP82zUP
 7jw1SaUPST2mTif2beF/OILaq7zlpHsgkiSK7Hf5TviizQc9FXNXynCacXs1WwPL+t+Tgt4OYm2
 9SjFrenO6Gptqzf7K7AeyH/cW/+wl5mnNHcqSfaehk1aktGspTBjJsHCWeXZiE1eJYau1mhCrdu
 b06bvqhsYjfEFdRjUBuf+WyAc62N+Y9X3QyHZWF1LSDF4fIb6JsgsMu6+E3DRpaXh7Mp7xK6GLm
 EtUSovR4Tgcb5Zz4QLvDknR7VrzfnROG358EokYIrFaNmlj7/yw6rhu35aSu7ia/tv2bQVIYOZw
 ck71VsNey9777Amk+8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX6NX29BTU6zuC
 U9ms1jxRmTaos3KencgmMNBxEazW/QjMClHauBuvoSmH1qN3cMEBVzpBnCktWRv6hH99DOa2C25
 JJCxIQr5samQ/fNxyczvCy4KDtgq4/M=
X-Proofpoint-ORIG-GUID: sPjN2-t7Fxt2lLj6qJZiig7UXnqfxTGD
X-Proofpoint-GUID: sPjN2-t7Fxt2lLj6qJZiig7UXnqfxTGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011
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

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3

