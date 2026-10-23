Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F289606A31D
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poibAIZj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L7NmYWoF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EA810E644;
	Fri, 23 Oct 2026 13:41:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED99112B50
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NAAZVm980644
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=poibAIZjMsIdwMDV
 XD0Nb6ZGIrSar5g+ftoe7oeKR4r/ureliRS+fwtmnawiJ124haBPlC8VnHayoU1N
 P+JeiFeN3xPm7y8+gcXnNENnHMJrr/xtUeyzGXMpTmEdMwTQhyr0d2aI3MmuXaAU
 NBtFKojVwK1FFS92X8KqitmvSbY2xcZfHPhMk16BrldUGmALTTXYs6HaPbP0d7en
 bPpD2ylFczswpJvRbbZv8s/LmSdSc+unVFBJbmR8A67mOlzTdIKgzne428Q+mtmJ
 1LAIpPPnbJm1Xq2ZRL0XDKy9G7vIYgbuRsZidUDN0PR4Pij8xI9FnjlwehYDDLcs
 gNs3Tg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmaubre-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f33438950so206413685a.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Oct 2026 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792762832; x=1793367632;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
 b=L7NmYWoFHD3SGqmNwNrsARWHf7q+5lgdkoUILXZRhQ3nlLghPxWQ4IrwD0q7EeFuA6
 RVuWJOe3F8okE9ckezIdQuzp0aTbKL95SFn5yo44sdf5fODZ5AFxek8PuItoyFfCw2ad
 +gurfAde0eDnPa2sx41NAsTdG1lclu+WCrOG7DBlAbIyABje7k1f7ktT4peB/GGkQnCC
 XkGLkUY5HX2OQdOAEZGfHS4kVvXuQIOAE21D7y6PRqmAubmwuGMaNCuMHUIUBWRTnVj1
 SY2fmOpMpPHylNDKSaUms1v+9T8FtZuqhdu4cYSSGVSm5YxDfzko1cz5eN179NILq8As
 E3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792762832; x=1793367632;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
 b=iZZcRVox7id4FbSGEOmvHKXUOPO4wckfzdugwOaMCeJWZWODTmmkGdlUi1c2gwYV5s
 Rrn9EyqJOR64QbETJj6HlIY1h/b6VRiXjlVOH7wi0iya2p+QnHAFeESs+LRbNHvUPBV1
 iypn4YLsxhwGPCtMlMrRZhfdlr8ayXhIYBXskgCE9buWaerj8GkEMzlYzvTPxuvsMBbN
 U61+HeTBnzmijtFpV9K8gJNLQDGvkJ/yW2PKeHWkGI8dFsZjpubXc8Iu8sn2/XS+SWaL
 aFx0W2KQBqfEI0qTPV46H3KdSbPhCNv05cddh/YB5kdJ9XuAIS3ceHE6d343JTw5tpgm
 4G/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBySA0k80MYfi6GOTmEvLHFr5AExtiKdB/r4/AMwlHbXx2HoFtun9yTUWmfpUl5Pinxbn13V28HyC64=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLKqptU23rjGIkt2CqVyWwlygrX5ZndUmIDxkGoYhg0gS+D/5kR
 G8Q0QLkZ2pC8+4PCvqLhFdcqghKWueXH1LHl3HPXzH0gfo9DV2dTQxj8xm0wVrmWmfGB11VIDFh
 GFkPMlb4VnJIlqvpuEvRTWA3xlkIEkeL7wR96ljDHDzcM54FlyILQf28rMUD1jEHdnj38ZS4=
X-Gm-Gg: AYBFou3OxxBlYqjQPorefwuKnAH/7ki144wgG7XkCudvIxdTbM8oI3fv6xQD1AjfQGH
 XyY1w6OjgZPmQoMAMqBH200eqc2gQjqiBrVY534j4/tJPltJrSv0vcMxX8Neb10Nx1c45KcuZNP
 HWq8dOBrhWZXNhb8NvYr8jqff3dqtFzE94ZGYazavJFDat2zJ+7VTFoNvGaQlJjqLdh9GgGYzgR
 +dC3vChFKTkXSu9JoImLbQv6qD9nhjYp6uRQw1zgxsqf5NYJtC5Y2bS53QPBMgStHuOr5WHiBjK
 nGQhwKvAQaVn6rY08c2PDszarJxCk2fjey6hSmQAx6fUCXN28jGO3kbOSWA1qruPxahrPojp+cG
 eDciGAP3ZG/w448+pJt5NFWH2bRwaLhe2eC0rHwXJkkrGn4m6AhF9WY2qh3x9Y4N+8RzEm5yysp
 alhH4HhSw4yygC
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id
 af79cd13be357-93f6f7963e4mr426443485a.35.1792762831907; 
 Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id
 af79cd13be357-93f6f7963e4mr426438285a.35.1792762831367; 
 Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:48 +0300
Subject: [PATCH v7 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-8-57a3aea3f09e@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OscK9ARrM0xnQy9PIe02PuQJWITjFRTOxcw
 EIXvBeXIeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrAAKCRCLPIo+Aiko
 1SVnB/9eqhMlFfXEGL7sx5uXnIsBFG4ztodN0vHA/44YV7W7G1OooLgbsvOvIpeBP0kk5e5Xhco
 j1tEinkSJoggU0cxwS2Xc9lfcqEmcMxaUo+LdMPd6j4UyQPiOiKsO5lJfHqCDXACMtfwP3c5K77
 YVat0zINwIdZaWq981pjrXiShkMmW7ZQGmd8rt3No0CePmXgOdV+xTS/b79D3wsbb6tiSGUOg/3
 A9g26pbXGiiAGGY1vEM01YKIFcpTtym6NCRX66BMn4aN7mb99cUWHM4OWQDs4doSiyeDmJrMeKF
 MVvCWf8Tx3Bz7WNIMfMzZpHZlXLooV/h/qxj6hCGoxZBslSn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb63d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXzcpVG+gU2dgX
 w2qM1FVy2y5FLmg6VtY5ipjHLriANt/mkPvOSOf6k1bah5DGOOCvlEOr1nSRYNeB4HyctZYJVT7
 OpjKayibMxFDhWz4mEaIPsNuHOudvnc=
X-Proofpoint-GUID: bY7lc6bz3s9XKIaWIiMl_xzh1T6z-lJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX1idwowarTBhB
 LOTqTcrZkkws4dnxsgB67odk1swNiaSDh9sMZV19/MY8gK7V8i+LKPPhi5hMUyxptm+Dy4Dq+s5
 CO9JSZXomvdT+vCDDXxoLQIssYcOXLepMoOjmhyrUgQJYV7hRqD/jQIRmgKh+yi7/TN1fbPEOYG
 ATmDiOXdOAv0dsH8h2rDMgvNYEiPvlP3sg4GMFiYljOOMgBBadURKtrNgJ1ZIMm1ROBzzXzScBr
 W4MC+f2pGkp7T6EpCYVOE/fCIRFgMSKFuDVoo46ZjKJnej1qHAIvVRKV1FrS9SdN6wFLrGntWl5
 CnhVVlKnxiniP6gjzAl2VpDO5R3be9ZNneuucixfTvjneMNq36Lk3tV5C8+0ffv7fHOQdOrGt8a
 H9isJ0Q/Kwz59LVuRNuqwAKXZI55WFbSEXMRv6KyFsObwApqIIegFfD/JVboxdblGoCDnvfi3GM
 3NevUM9J0NqzyLJBHMw==
X-Proofpoint-ORIG-GUID: bY7lc6bz3s9XKIaWIiMl_xzh1T6z-lJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
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
index 13c434f8d03a..c463b23c99d3 100644
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

