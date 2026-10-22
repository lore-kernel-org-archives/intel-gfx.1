Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D7606A31D
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Oct 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lDZZTSrs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPjvCaIy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2FB112652;
	Thu, 22 Oct 2026 13:29:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400A711264E
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:34 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MA09063115688
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=lDZZTSrsyHzIsGBU
 PNHByJxzu03sVuEFd7YCa9N4r/dTQMKGmX5g6LTrvGZKfxSVdSkvQnawX0Enj2Zs
 nW8hDHxxVDkC7W8oK0W1IHzhDvyLhFvjbe/s/UmIPaEd4W/t1M2uOgmhipw2JXJQ
 twptPeIl5am4ilbMTLfAM41gLjjifhlKDZadM8+uw/8xXnssNP9BAb+54fS+/KC1
 oem4zKn3O3B57IvTePSecSpKhSbe07Y9FAURIXt2xn0Qu16IASAjB6qBhOACCJ6k
 xqnKWxsW6B575ZHIaEg/r/xyVHw1NaOTQSGgi+OkzIbX3aXI9wYliFoMn7FIobxh
 nKHhCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bus6f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93e49a1d3b1so438458885a.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Oct 2026 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675713; x=1793280513;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
 b=RPjvCaIyU0xZSn956qGlSYHOpewADTF4EQ7vXH2lYauw+QPvwFO9evPXl0dnngUIiq
 dnoMD3rL8zS4fxCpnlCZ3Qzo2tHmMTe9oVZx22GcwSnf20RS09ByofenI/OR1DZjlArr
 eD3vtTg0o32vPWbkokAqRzKuLRv9OjESFXzSA2FcFDkE1I1orcFCYE5iKOFIF/k7p95R
 Q6TUNPjHMlKj3S76K8JueoVnMnufR4PJAzHCuVAZYSYVtqx6yLH4EvUpMz8x8yaodydk
 zCOIcgdbMBJkv8BihDvqfjGwNafkRHkjMjDaMXXLPfh6w3g21G7fMFww0Pj9iorkHV9p
 enmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675713; x=1793280513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
 b=i76ykn82XnXDKMOBXVMKMVEnZ/UMbkLtwCM2KyIdJm1Knc97E1K5+R2LLsc4NiATc8
 3U6PL5nM3Ib4GES7Mc2R3Wen1GAMObaOL7nSw+10cmCZyrTwPDoX+MpY6PWEk6mEedCa
 lvoH4kRKrmPcmQ0KRGje9/bCPROtVDYMouvvhPZKFxVVBF7PNQoFH5Nb6S3EbBqV6RE0
 Nns/8BH+47FMRSwKhT22jegfiYUCzSH0rSqnUGBjiGJhIjlb5IfqKJ0dd1+DkuGpcFM9
 CWfbT2RmVUA6zH7TTrEFkSCSdEndB4tZ42oNjC5IV1BfyP15CyAiGe9UVM313xMO+b0k
 Do2A==
X-Forwarded-Encrypted: i=1;
 AKwUvByfrALKgtT9ZcjBDVNu0ZW9B25LA+E6mnmaqP+f16ZM541jS2Wo+JPNkmerzVo3ApIwwB5ZIA/uvp8=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYK9XI+BGK1B61TEPqlDZ86zt6hHe71UOUbrEpGYkHSQ6nyw9mJ0
 6kgPVcLSEhrxV4fyRwm/R1I+eV4tAn5408SEGctzyaZrCSZmL01I92wWUjAIHNLVnPpY8U8Ktrx
 gztM/bB10Yk/tOnY4g8kVZm+veGtJiM3enrThBmmdxEwuHAk6GK6nQtwfrmAziQAQ8s8HFo8=
X-Gm-Gg: AYBFou1TPYdrjkFr81jS1O61YgcnQBuw3GQIcM/nbd9s7YXn/KjbninqWLKJQAfs8ZV
 rQgi2/Q4LfGOaDqBlpmC+jCleUYmx+LEQJ70Dfx6YEcTDumrZcBtG6I3zaH4Z6DR/zs6sTPiTm/
 xlhxZzZ0thB6W5p2Ml27oNXatCnOePkjknARdjQVpxb5qLkQsnvgZdNibmVgwpU7aFiJn7d3mdh
 GYk/sTEpn0t/fYmjoZxFuioRfFdhHAtjHY7kG/wNlwMpldjsdpMbW6BO+NF5DXYV8IaydfmtimX
 99+fX95lDVOVTZSA39K8vRUXYqZCCVIi1CRjTLdjgd3ilRGPHDU0z/rVcbFeF/+vskGz42H/eEa
 tsBFcFBOBb5aB9Ggxn1c5lR+AkovubkCRkJP8fWJQ24hxJX/eYGn1AkeK+JeftXszL7cdzf/4vv
 G7NCxNrAuq+8k9
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-93f57f0551dmr905867485a.25.1792675712656; 
 Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4441:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-93f57f0551dmr905861085a.25.1792675712171; 
 Thu, 22 Oct 2026 06:28:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:03 +0300
Subject: [PATCH v6 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-8-337ea3ddaa62@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9n9zhrOEK/rx5gX2YWvMmc8jjptMWLaOtO8
 lGcaMlPGN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZwAKCRCLPIo+Aiko
 1edwB/9YWfc2EM5dtSwi1Jbu3T4rlHmDDCXXx/nWp1kfXy0H2CCngN1eB6ZYMcxQtWmtadH7jVn
 o1ni7leB3t6qsyNfhfjzVK9bH5DxI8ykunhBwboni1mwzg//NnCAkchdPC0bT/n15WxKQCLyNcm
 Z/qS/EDw2gQ2yLhg3dHrpwM8RPmJ9kVwIvpF7K7Y2gbF5wAGLrBYa0LvtwCVS35/K/RvlHejThf
 6VdCYsYBJHHa9HS8h99g1E0vihe8vNmkSPwrHgdocyqB1rPFA1Xs2dD22Vyh1WLnDJ4N/9m0iag
 EISm7/cQe+/sZsMYSOeTi+FTCVIt+wn8wBzeI+jPBp4Kl2KP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX4rBe5S9eWGAT
 RvgKpa9+LLtlR1k0TJ3rIG0Y+apdtNrtzmvxxL8q7P68pNFkKxMTOPcxQOHIRO9HykGel5DM7AE
 WnpM14x4sa5qS3hPXeXJJkUYt+yJ4M8=
X-Proofpoint-GUID: Jet-w6zNXc1Tvb5p-sjAK6WIkV1KJYSV
X-Proofpoint-ORIG-GUID: Jet-w6zNXc1Tvb5p-sjAK6WIkV1KJYSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX4WYLwyYR3tpr
 uRoPBsE10lCHEeIpC/nUPftZQqRsja5ZOrIdpNRFG2Bqy6FMpHHTq6R/CNnH03b9nHp0g1kcJxq
 xwI1V0xg471Rfvc4/pRVd3eUx2/O1XDSLwFAC6tnJYsF0vv2i03mzo50/Aj6VD5rRf1SnDQiyRn
 KoOwhAXFuXAu7lsUxhsPtPv9DwuEcdeyaSozAYjmytM9PMPN+C6+vTGAuPfXmLfEjza5MrDJSUx
 GTO4DThWSmbwLrLkt3bln8O+kwz3ClYUbMD4bfIs1SZtJGiagpb1e4p1/BfxFq+D8juEDPw0IQP
 5unjVPM54G2/wzGONH/Ro97dRPgbDxdPBB8teYb+4KtImcwD3cpZssT96zY7fgOZvvPKaOx/51w
 2lQxABpJX62B3UaQXbH1dctXOrm5Vw==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada0f81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

