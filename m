Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369B8606A31A
	for <intel-gfx@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMBaUzhb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjp8PKB2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDC1112D7D;
	Sat, 24 Oct 2026 00:36:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB7D112D6B
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:16 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NLutKJ877080
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=RMBaUzhb5M7n9n2K
 7qlHeN9QBrAgLOr2o1DamNJDY5OTVrTrOlMly9pzeu7ACQCd/0+QBst1zBlclz3s
 5zYQTOeJDoG0gFSXXqGes09udTYU8DDv054WQ8BY6HUcqj7cK+2aeUd6uHXwzmXN
 2AjILygpCk0uYvzUgSAhOsI43ghQYtDKUSf843zxc2J4Dj/Hxg0wtLVBABaKQ29Q
 ytlFTUr+GIGA88giMtUPP/UjHwfcb9+Xfs4QzjE+ep8TZdqduqdXHZDwHFWhMOal
 Up5oQZ3obou0HzFGXkPCg70IjHKcrXRLnX09W74ke3rH+nQLgqoIzwiLwjUnOA4R
 J4E3Hg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr691m2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Sat, 24 Oct 2026 00:36:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f37c94ceeso505404685a.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 17:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792802175; x=1793406975;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
 b=Yjp8PKB2OuZ9t2vCmMCWxEpya1DF2f2Rp1j5+hplktNisi9GEnepJazmDdJCBEzW33
 4fRFbYM76HPLWcxWkK5f4hYiYhNRPreCCZZm+aUivNOw+7/Mut3s1t7ksBgD5A98v2xM
 4Tn2Q4/PH2iKG3FU2BiDgWnfZhxSfYg6oO7BXczvGNzoJA+cDOFjAWqi9e7rVL6i8dSe
 Avczua8pPmEFd/ewbHCrxYJlWgCRxX47E1QBUq8dX7LAebnAdq+c9AQVMDJbfAG7DgFI
 XwHIAuKysGcI0KvUsA4tBjUWDNBRQYHjV7QRfpfACGTHmFGuZRjl8o6lDYKpDrzblbFH
 K8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792802175; x=1793406975;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
 b=E6rTRVFT3r5F2WtfpNvFE37daadp3Jdq7KrAvpDmxDevHnu73CLyNAZQ1ybY/m5rSZ
 nSmFzoeigcA+73Q5tln1dx0MOoiGC7zGDIJsteRgdJjKZp+P8p/2cdXC0tHf8MOSghHG
 9Q57iN8ApBsWuH5HqywEPrkJP104EoSVDAzwKgSZCtYGA05FlFV78voEp9cWBeXGkYzs
 AH6CAUlgJ8PQ7QfA/oNIRqNaFlF4tshekCEnRKGoi8Cbj7mfnkideP+8X8+USkmIKlTW
 G6t7S3HULbd1FHLeQK3j3r+NV84sswfW7dYtsGzHUJpYJWU3xG479vXTr6+8K8RJuvJR
 kRDg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzaXTJarYg/y3t5LVAGNObXr61ZhB+Dd8S5SvhQtC8E4m1tyyJr7tmD4SFpnSCH6Z/nU2g8Xz7Fccw=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIGX32LYozSBFHNkBB6Y10L318NE4klHhHegFLqRgZTcTFDJrlT
 VxpK+952YKZecqgoHdlr5mwIYBEYGA5rO0sEDqBBlzbvVQfjBU2g2JZCDrLQ05ziYSa/KR525Ky
 4tYFx4ZOOvM+iOF94lwxt6MgC10K8gtUFibnH/y+fXlQNaN94orkfP4kJ/L9tSLFZA32rLnY=
X-Gm-Gg: AYBFou38zN8Lgt/tGdamvMa+ngCnjN+D8AyrKwqKlbvv2gU+scxkDk/rEHzlw3HoMXK
 kxB8l03hSK0kMnL0+zPSO/PDLHGOAddsK+OBQCTYwIhR3VfZqkwMNFugzcDEUwQfxbOdbS5H31N
 0Yed2n2zNNGCc18IrsAJbzzc0hNOYDj6rhBFpyx9AnqP+7R69LuZTctwfTqMaZ+Q7hvVTwXxMzh
 JTfMNYD+3N/vOPZlsg/P4Uw2ozJ/jOk/fKSPBd/YlCCoxUBcW5TNqkIPtVjs/0HFp9ycc4Lkz5X
 IU78Oe1fd2TwwXgJSLuXxEDqlgC+71jOaJFhscE0g+2fkFJdKB/IXcF45eLT2YND5Yf3ADpVuo+
 INsWQo/zqyz+MtQFDgj9ZhOEcs4WrsAtqgK4R1I8ISdcydqF+p0d63Rz7qKoilutUqYOrCZZoR5
 bKMcKaioa5SVlJ
X-Received: by 2002:a05:620a:3714:b0:93c:5952:5765 with SMTP id
 af79cd13be357-940ef7d3e5fmr99110285a.6.1792802174863; 
 Fri, 23 Oct 2026 17:36:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:93c:5952:5765 with SMTP id
 af79cd13be357-940ef7d3e5fmr99105785a.6.1792802174363; 
 Fri, 23 Oct 2026 17:36:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 17:36:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:25 +0300
Subject: [PATCH v8 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1Vj92nG8f9DdF9Mj0lE9H9CWxc2QVarSsPq
 X/6E4ln16OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9VQAKCRCLPIo+Aiko
 1TdbB/9kUbzi0zBSP8iFmpiyHhq+5vd7f0SgWlQeOKEdcvbh41d2YGLywyh3Ghui5TxWHyxZnE+
 qJaN+BvDuOrgUtJvLgrIiuLGIBwhIKMltwQ0hYeX38KBCNn7xvHTRkCDkTjMZECnH/UCPa+CFjd
 gaBfsUhoeSzFrqvXZvV+QjziPNwL0DPRqSueHeq0zJe2ElLryzBxpxof8xrrU70pxA2uNUY6PSu
 8Gouxh+OkVkupdZGTkRkVy6HWlyj7npO2Do7rrfZIXrc8TChTH229Ry4k1ayA1xdKmTKohgC7le
 UU9+PxeK3381gpDvQH9EfWfpWGE1MH2LK3SsoJDK9f5dSP63
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6adbfd7f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX306zVD4bX4En
 xRD1htbT+2IK99PXQY/NK4cD6ojhWX9XIh1CJcaw1vXR3AEdjeTrC13Tj0xtp/zCjMgsctzjuq0
 IcFvYaAfqcGN3gXdzv6FSSZ3qXdRzsjULg9oVaJ1LT+KVsRdKnn60FF09YOWk1m00waVQGHE2Cq
 EqaKZQZBt8Oaodg6+mb+vHrzzvnGjxmsqOu/FnQk9yDO8TcMIYk4vJbKoehx/Jl+h9erAP15ysC
 iK7UkIzbtieswFDcVkjuBnIJdnLux+dtl/uTZGCawp5nt3mjCn4pzePoYL6dszXaELoBUrJevW6
 27c1XLfA+exC+MZ3eQJof9B0uyFfgmnQA6+q9HYVFO4C4nIrxef/q0xumpOXtJ5UjLS416YV21m
 gN/rrqITeVwGa9W4/1VkkWWWusHQn/p0awp7f6SU4Q5UXcr1ric6Nxfa5LPlPCZLvIjTEVqhEqJ
 ovLklphta0xVOWG4HAg==
X-Proofpoint-ORIG-GUID: RsGFYb0LAwOECRE4gQQXEcN__iu44MLz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX/E9wxHOjSmkU
 nNYXhsQNCHvrDW94KzKnI8i4RXrXEOSWRUxg4yAFWmgVds3GYzdKeB7VVOfOImmMayQP14MKnz7
 gqwb0vj6pPq510lJetLLEHc/5sJW6fQ=
X-Proofpoint-GUID: RsGFYb0LAwOECRE4gQQXEcN__iu44MLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
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

