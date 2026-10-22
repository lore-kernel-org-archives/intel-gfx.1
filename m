Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F55F606A32E
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=huq6+EdL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ca5l99oX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1111112651;
	Thu, 22 Oct 2026 13:28:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF411265B
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA0Fgc2397094
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=huq6+EdLHIG2IKh9
 fq+pBx8cZXxAlw6MNLQsBsBq/skklFtFTkH9mSCKnIther6jO1a/HCONVvYjnXN2
 QaDCt6zjurulTvzpcbiYaCRzfYZvR4c1oCAyDzlgxAPTxrJtmDUH2olZjhE0ztaT
 V6TNw4uaZ2X3NoG8Qp5GL6OFRwhDGX+7Z7cqCx/WnzXwzLURb4i7N2oPXwzAmGZg
 E4j7rsqN+RkR7XbGOp/uhX4utIY8PH1+EJ5AY8tegI2Q3Knpq+Leq6P/5u6+b1RX
 VdNA7E5J1CPiPvBlJK+4LT9ybakIaQavIzrJIYYj/wYjlKKRvoggcIiE3kj/agu4
 izt4BA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bur50-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-917a7c17166so40756586d6.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675714; x=1793280514;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
 b=Ca5l99oXxfZ05SAcp1hi3CPQei/kYdCslzHToC7J33K/4D69zgWlRf4Tyk1wjLAF4l
 rBU4JTh9JV12Vhr91dPd80sBHnoTrFOllNjdmSB/8NRwZFgLhjjGcLiBBRiNIT3MzSzC
 n5h1mJgbG+m+td6AOO54iAamhIIccWi15HTyKHcba6Lx/2zzuzbjJ2CEOKwG2eEaoJRJ
 F95yWFbrd4+9nKlXVHNuHKsNFeZgCDnrSp9+ANFMH+4j+D6xrXSrkTg1EUdDHmiZnbcp
 NfMlydEqoRaO6iZebhMKoHzji2YCaLJs1HqICmlPGuX9OgrzcOv1YdPhJZkMlpiL9m/1
 WovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675714; x=1793280514;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
 b=L4NQW6+wBNhcFSmwuLnQuPayUtxNryDjzZHtpWDqchujg6qnaLBmrx4LFIxqYT3DlS
 0wUPid/Cbc3VCwNf46PHCbJrQN+fMqWODmgF+dGwrRmM5glUNGh9InrIDDo8dp/kt+yP
 Sr/vBOEt/H/ZbDYyiT0VM1kG6FTs7Zb7ACiUor6Mxl7bHOJ3E3USD0CP/O9I3Mw0Cdx7
 AjTBUThTMGYLQTjQmkr5h2ScCI6KZ5/PBEk2j2dgSgzpbBv1NmKyYEo4dGDsGSJuc64z
 kDKvoaH/evT+zYjfKULBb9kgTj4UGfiqzN6Pzi1eco/gtSmpImVcveDk7a93FqHjnSJU
 iF9w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzYXEAau15OToTw6EJgeYcIUQ61pYegUP/pRR0ynP90Vn7WyhRkqbTgfKML+9+kOq/bersDW0+BACY=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLByLOOXXtiL3Db3YFVa3ychilS0kTINMFoP0lXfZCNlITwDs32
 HNZMT7+w6Fb1l2dCX/tcT6a8spMhzZnmxEp5aCNC4WB2CKtlR8kFt7qs2yHbw8F4X9a9a1HXnws
 u/t5JOEZimyw5nU5Lirnu1TGBWS6d9QnrQgtFQwkWrPN/kISL+P+mvgF4IeFOBSwPEOyyetM=
X-Gm-Gg: AYBFou1HIjBNSASieXMw6WzrkmXU7IIOtFgHDByxrsofiPBB7PpGtiPqKY1sNKd2vUg
 o76xPX2ZMYh06MpSSN45hPCJ1mTog/SqrK2SvpIM+kwe5zokcN0q3F1k8vxTAGB/ieZ+9yUb6Af
 rCCc4QM5U20COflz7XAT/0ce6WGuwGLZu6U6yc/xj0AlfPz5joQ/qqvvYh5FMHoiFf+/IwjHxeC
 SR++SHqdMqlsqoiHOqZKwW0Vh4NMo9tHjhRpkYpZKSGlIzCAA/VbSW00nwf+435VwspPT4pX6aD
 7OJzKgLJL3FHaz7kCt+/EtC+y40ejBZgfMtwhbbxxEKUsiv3OtU2xH6imIqzOPg3J0m+uk2Hy9V
 I/WAfK6r9U+Qr4hHa6qYzyKQIw5m9LMzG6ZpP0i3uEJNnfsGyJEo+rh3tXUa87humn7z3Fenwgv
 Ct1vFzSdaRdmJY
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id
 af79cd13be357-93f57e45af9mr860581485a.4.1792675714388; 
 Thu, 22 Oct 2026 06:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93c:7f48:8f46 with SMTP id
 af79cd13be357-93f57e45af9mr860577785a.4.1792675713861; 
 Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:04 +0300
Subject: [PATCH v6 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-9-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9oUOGyoZ/Lo9msFFhzc2wcKn57bx/TRaPi0
 NP7H+uDIseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPaAAKCRCLPIo+Aiko
 1Qn/CACG1K4eJynq5qB7lVOT6butQGOdb0Uhg1y7eGfXBUIIGj1DRv6ecFzKRRK0bqqp6pcC5ci
 EIrQitRmOJrdtYWSEpurrdG1g8G+KPLJUhVNQEysupJKk1UtdeTjjfLKzFo0433HZaIXhfDpj3N
 K3momphg+N2wrPSqKOypSco4Z/DK1vaIXXYy+0UWhUxrrYMXstFcdV6IsFrEXkcVoNcdL9pxLls
 IJxAjrrVY16uL/yTOwggUx66Zvog/fgGXfehXKJwmzjWKCAkhWW369L1wPJ5HGNAbqCPvQESo/X
 5Wj+blNVgBLSYe62VO2WdSqoGusXFkACUWYMezRkF7KbPzw6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: oEjtyRpULV--pF0-muHJsSAD4Tykp6LU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX0kuImBCDVk+O
 5nK77obASqP3b3QAbxCUeQEKLJy+nE4o6Fe1pNwsQ/qsfQw6s4kZNWltej0gtj8raju9OBAdMY/
 HtO49ZE7jPA5XH2jfsuHFcAjmnp18QE=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada0f83 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: oEjtyRpULV--pF0-muHJsSAD4Tykp6LU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX3fiCoQKdWFxz
 PXPNh5sNkMHzSgZqvpEEuxZe0Y4OcOtsinmjGSOCB1pNEOWanThMLwkKMqfd9OHLxLQMlF4rbPm
 eNJU6Xc9Y1kDL6eLTm8/dLu7ZwYN9ttSZJXiDR7L9g7PvMcnPWdUiw3zBRUAvtIhWURnEQy9f9G
 xBpBBQ3OAYEh64MD+pzM8/kAzzkQtYIsdxDUpKsIt4i4ENAU1+oWnzt3A6oUc/b52pouonK/5Q8
 C38TUO5uDCjZziY5XzmT38oMK0R3KQn/wZUBSShzRkVAW2p7hcdP6vFIDCMMVsmAxUALBIUyH4S
 jFAgXhMEe7SHqdLwHZBWm7hiwmL2WVVfE1F/p+09wfEfy+PHyMAohwPMrlVvKC/hnApNZ9QZ52Y
 6YLgBa7K9ixekHxMQ95YLvMCSJc6mYsfH0o8MwJv7k5g0MeRxpm/n6GhwST9Y8CSr8AEwHcf47V
 466dfa6FdhPniSyaltQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220053
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

