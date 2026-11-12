Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A04606A321
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2026 02:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KI/qRF06;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MB63mz6D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B1510E3EF;
	Thu, 12 Nov 2026 02:40:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385C310E3EF
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 02:40:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC2aUih1475355
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 02:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=; b=KI/qRF060qDr0r2Y
 cJuOgXtsBpuDssWcFJlKOO1nnz751BpTeh9oz1oPGvjmslvWwhtLwO06nYw9Mz4r
 ecj4zy4uuMABNaIYsfdpdtFlcLHOb0GPfLodjZXjXNDK8Vf+XQwfP+fvVcSjA1fG
 8h4TorsRex4rX7DoDD7Xb8uxUGXLLNcE7DByWRDzOUXxuwCBoKiBaRMH9GFL3BUA
 /SVMy9oqTiO0QrtV7oovqEHmjChkcnZA0sdNFtNSTh5HzTW33BNQPX4QbldT90Az
 F5ZYYFXjKa2Gozlp/vRRIx8hfdaKFek54kf3AKzEgLxcExHQcVbuPbqhhr1obTxj
 daAuAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymt9n3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 02:40:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-535131e4c25so77715851cf.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 18:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794451219; x=1795056019;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
 b=MB63mz6DLZYSoHsTbjR+0xTdgw77ISdF9F1cWV7J5CYrbRPCrWLtxQVE+jq0TkUiKs
 UO4jxuxQDNLaol1WP+Tzz6FEjEVKYPVSXzc4ypsEwkbVYBbHXNPF4dtQttj+3mkG4rm4
 /sk/bziO2InVR7IVnJRf4/Pg4HT06S34IhZFpj5mGR87fld8Pc0nyyrTFdWNSLEn6u0M
 9S1h3U8kIM6QPBWiuUgAoBP0UvQVbzHGjbmfQzvv9EPMpxktNOwsFI1czNtEh8/7AZwJ
 QSihNR740Ro3mPdcwmhxRrArUI/WMhF8aKn2iNRGnGImpznEyeZiEEI7h5Wuakh4clT6
 8azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794451219; x=1795056019;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
 b=Cpig3EgkN94ddUpn0cywLEIo8LwK6/SpaDPOovHlhWGSlvBo+elfSIUFdBmohWhxld
 O2l+pLEhO5qfOKZr5pTgEOP+SfIlbPHr4mmQ01w32G/jwhp56uMG6J5c2q7hpNpMYPeN
 zHVoGF0PqvjK2QIQ7Mb/ZQq1NIsG8tFrvTN3tc3sJOKB+pLIjZSwctsfVuKGquS2iUC/
 l6L7iMkuijQFHj0yb/eZx7qKk5Ul3vX+RZ1jqak89O/DzlkJcNwYICCpFC93CvH12K8G
 wMftT/qrz4hCde+zzVL1q1g45kb9Iqo6FExz0b358Z7mMiS5+IHs21vje7CiGNDcsVrT
 p2jg==
X-Forwarded-Encrypted: i=1;
 AL+hErHiMuVwrxvm7vx27Ft+KJ2+nhbcG4/E4vVNZ8OygzOwTeSH68WR9ZlVPPjp/qrzJ72LLtsBKjcZdlE=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8GPMHzEJhB65GlJ9m8eBQTCldMyRwJ/Fg8P8JfmOSa3i7i1gl8
 PTR7O6/XSNI+HsRnNHMSLakLYZKywqB77PvoXtxi6ZGCaP9ixR2mltj9d5OomNiH2AYLO498W2s
 Z6Vwn2ZicweoHdvtx0cwPw1OUGGDvXEwC7/OZTiLqqZdnlKLQJp/FW00CqovJ+UcUta6WX1c=
X-Gm-Gg: AYBFou23inXKTkkbv4BDJRgdPGP4e+4da5MHlrSWKeGAbIGu6rCKqg4QIOcPX1wA42C
 j/6qNp0hwp4xp24/8ez4VFu7lCsVgfhhzqO9joWMrPSBNKLFI3jwSkifJOg5R2EHETvtyS+kDLq
 ke25WZbt6BsL52W5W2J95MixZY0XVaJCdFNlP0PN/RrNfmXUhOApVpYBkB2OWH/RRkqhEjh/5Z/
 bCHca2CvpNVxJGT1sJcJE8l9Ok32x65jAg0MjWU7Y+acpgYjc4Jtcc5nRN5IQW9JzRzersnhg3N
 s3Gyv+XIYYoGoFC/+ey1HLROSDos/lbkPKI5BDblkgEQvbb9hFEQVVX0S35fjSg90Ux2aOyLsRj
 bGZ2lcjDh4fHtEmsnbIxe2dIirL3eVc4kkYYEZ4AQFk7e3+ceRY2ZKiqkKXkPw/tVGq0gSaEs7a
 Mim7nAaW9f4nZG+9/pfdAMMmgEokSnmqLC163ABYg=
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id
 d75a77b69052e-556c25188e0mr64866101cf.65.1794451219049; 
 Wed, 11 Nov 2026 18:40:19 -0800 (PST)
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id
 d75a77b69052e-556c25188e0mr64861391cf.65.1794451209677; 
 Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550bd33340sm64426881cf.21.2026.11.11.18.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Message-ID: <ffe9dd90-909c-4259-8a57-2ea67307a95b@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:39:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Francesco Dolcini <francesco@dolcini.it>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
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
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pwwF-tUYOuZiPWFYIgULFHT9YVcsCMwp
X-Proofpoint-ORIG-GUID: pwwF-tUYOuZiPWFYIgULFHT9YVcsCMwp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX2ld+M7kvbosv
 0DjdQEjwF/O67k69Gyv4WIGSpDk17FHx++RnUr2CkEtZxUz8xjVtVykpHD/CJqGip2tTepbIvYr
 paVg/EDBmxTf9p7E3xKgr5guErAWJOazrJtWKBXiGK+r+RypVnWRyrTy7yC3iJMNcNK3eHt/+5T
 LVcxkTTRsEx1SrIIsXb+SE/eIQtYNUDyTgreCKE1LM1fvS3qlPj0ghV/nth1Ah1i8LctxitiBBJ
 JoQnbIQCJSRd5bIiH0OZ/EBFFxWGRNz06oXzlrgjjTmK2PdBopVtbaLhgsNmv8RIRdr+lAQvWzO
 X+V02w/CAlCbgQ3FLWa3+mgIYUcZY+PFpeoo3UdjOqQGsmG6JLZchdhCWCHXYNhPRV214KLQ9AZ
 4VHUiXuvncW+rq81IWuyc68fxqAyVpwCyITDyL8I2PNmpl92CwXRQPrayHWeiTzh4PhEfvjjsFS
 uXa/WkwA1hOlUhR1mXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX20w1rx+gp00h
 cLC9ND92U8ATH2uRLVob1z7oUaz6bNw0rKt6N1qh4sWzcMVAQPi1MS99DGq2XwtVi7KejCtmnI+
 75T1Ojyj0o9/CVShpw0YVmm9C4C+7r0=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af52713 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UkfVDg3vQ6na--iosyQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120010
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/24/2026 8:35 AM, Dmitry Baryshkov wrote:
> The upper layers might signal multiple sequential HPD plug events. Don't
> take extra references and skip all further HPD plug events until we
> receive the unplug event.
> 
> Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index fa8942922b53..ce919a26fba2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>   
>   	guard(mutex)(&dp->plugged_lock);
>   
> +	if (dp->plugged)
> +		return 0;
> +
>   	ret = pm_runtime_resume_and_get(&pdev->dev);
>   	if (ret) {
>   		DRM_ERROR("failed to pm_runtime_resume\n");
> 
Hi, the issue reported by the AI is real. There is a regression in the 
SST case: when .detect() runs first, it sets plugged to true. As a 
result, when msm_dp_hpd_plug_handle() is called, 
msm_dp_display_process_hpd_high() is skipped, which causes the 
subsequent failure.

I tried removing the plugged update from .detect(), and that fixes the 
SST issue. The display works now. However, there is still an 
intermittent issue where the wrong resolution is selected. I suspect 
this is related to the timing of the EDID read: when fbcon comes up, the 
correct EDID may not be available immediately.
