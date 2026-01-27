Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D2AD25931
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jan 2026 11:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA25410E550;
	Tue, 27 Jan 2026 11:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOmoAHbz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgcG84Ka";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DC010E54E
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 11:20:53 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60R87L6P2379299
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 11:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=; b=ZOmoAHbzG7TQYghP
 Q/+fbofrkL7z1l7f55oU9lCHS5tFUbwHxZdoNe8x2Autw64GNBVGPZfGheI2QSXv
 FLteKO5fStxqgUtuFGTqtUmc3bhwpXiwUTAZq+eiWL9XCEl7E9oBmFcwcII/R3A1
 XIXCwti6ZrVikX3lgE3m+BnoMabUKfRhd6rX6vphMzGx4wHMLshJAZJClrQDYRtc
 V9wdwul5Zz53ucOdClomE9fcqt3xWzzcwLuJR/aoXdZY0kjqRw8azEK/efE5heiY
 9HP7tGuOK4teYFXiS9Y1Hx43Up5X4TKZSsUszoo+KyiOSAcSekrY+FTAMewIDm0c
 ocgIsg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8mwq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 11:20:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5f5256bfd3cso5730148137.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Jan 2026 03:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769512852; x=1770117652;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
 b=LgcG84KaZPT3q5Eep+sBrDDX5X23Vgw4gwvRUTjRcITxbVw8JQdBWWHU3qFeRJClGO
 ebV00+AOMpaJrnEHjEUhPE6E6qwrh6ZJZNDTTTa5FDf3qis2saW2EB0X7iRYH4Akku+6
 q3ddMhaOode/FNbfSfFJ7makH+HtpfoByupTgsHGh3KhYmXxygmuot3yF4efoHbHpLIy
 DiwRKP2QV6d+MpEUG4FUYYg7jGWP0h6aGdFb8a27rYlwXuIFEX7NP3K49xDJMJUNdoq9
 /ZlYgkuopEUvD3TfXU+t84EAA4aUO+dOlE6M+STOHMf0EJdTY/ALqXyARAwiJSKxen6U
 qCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769512852; x=1770117652;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
 b=boe0KfOyuSLMBd8ViCsouS6wYXDEBLwsGqiVAZFGiGQvZLgGBA7G660YtaRSsl1Czc
 1T9nRqKiSWOyAPVhX9jlED9vu/OCS9M6/6XpDXquVeWPwjQuc+kqI3YNUb6XBtjJAk1Q
 iSKGrVCwfNG68eJzoVVrRTmbrQKcVuT12QMFwYKS0+fLn60jKskI9J2RZdeiguOM9Dsq
 km8K70HHLTu1rPUJZcjhL0PYuFX7ceJVDcRLhpKa4xTqu8xvG8Z8HWn4qyOhzyq4Ukvo
 NGq3q3YxDdHi9THXjfWBHTb4wlw5oCWk8NyeKCh8Dy4U0+Q3356xsZ9GjTIHQ6rvic+B
 pf6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY8TtkI5aoMaR/k/fHOsrPyJdwnzLa0D8mGXDIW+L/HG1TftfIqrteYiZuhW4HzZBKNXHm11fLHkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywuntxz0Tm1NsBKHjZaC9U3dQsxQNI+9YXUGLdeIH7iiLAiaBYe
 U4DJq/1nQ9spnS7PeJ5iKIIqJzKv9qYYQtQAbc0klOw/PUz9ls7cJi9neR68Ww/yfl0/otBbNMU
 tDBbcKmeLBxakuZc6yRV4qBqoXEg/LqaPGG4hjefNXvUhLUPU/7vvXVDv7tPzzNPQ29atej4=
X-Gm-Gg: AZuq6aLNvgOQkTfXIf0Nvvg0h84/wVg98fGohJfcdWlKlKXXmZUHwze18EFNLhiGvp6
 Ap3KO6RXc9rJZOxfFBo+EBnYS2jZAZQovMo5x6rJ9HPzO1CgXpzWcTI0VsOwOxnxVERm8EKk1xP
 AxzcL/5onVYm5BmWwktydnw3cvcP9YcLAbFbLwK+SOKDTf6h5JRPNebRHXY/rHN+RxRj+qvt5FU
 tx5b3+IIBxpVAQInfEJX9rziFggJq7GjlHKu+DFzS4+AuHvHWjv5brc34JNoLlsGL16oq9iIpJ4
 hYaN0k+2nNJwaUHU89vPYntUAVDKcQvcgPU2i2AmpdatT7+HkCQ49Id7miILm7xfUQNpONzq7kA
 sEpNBmEvLMpSKfPyv1p+JR9hkPsOBVTJPFdXLk+XnObP+/L0idP2U0u+91HaMhKmneRLjgXUn/b
 /bALFyFg69VWpN1cmvwph9+Yg=
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id
 ada2fe7eead31-5f7235d4e59mr521463137.5.1769512851681; 
 Tue, 27 Jan 2026 03:20:51 -0800 (PST)
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id
 ada2fe7eead31-5f7235d4e59mr521455137.5.1769512851297; 
 Tue, 27 Jan 2026 03:20:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48f0259sm3368696e87.45.2026.01.27.03.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 03:20:50 -0800 (PST)
Date: Tue, 27 Jan 2026 13:20:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/7] drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
Message-ID: <ftkgk4xevcfe4dyx2pqi3gk3bqm7jcv65qvn3ypgrwls5dyx3m@srsgbmsteifw>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127104406.200505-4-vignesh.raman@collabora.com>
X-Proofpoint-GUID: 3eh_6FuRnLVwC4GNVd2DAWeOHavXnrTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MiBTYWx0ZWRfXyJKbblDk30rX
 wWQvkZBj0X50+LJL1GVsedM0frvGuaOTix7uK9FxSKQJj0kCo9syDHJvaURIehCuyT06LZXznPY
 M/6vRS05bcZlSsP8rYSnG1a6BaKBkLKVQSFOFTyXgRPb49XmGOyx3TJgt/0D0ZzTaCTiSPWB6qV
 5d25HZeDqb5Pq9Vv8HRFIvtVy7YJUKu1O27D9pfZwa6Uo1JdwmofR+XwaheYvYpj6pd4McY4q/D
 Jng4X7I26eynpgIEIMzGzYILdO42sV1ASOSKAdJsixbMH//9Wi7YcpkmtgSk8KKVCluEXyhI1UO
 s0vmiI2/P9QzdvkdiUPb9QM5yPtFJWBWAgPeVZD8/6HKXobu1u+PrPSiQseo0pbVezEsaPzuFYp
 nhlZ9UIkiDOsUpDcqYTAyVFXJdQXnzwXj+WJt/fOm2IDzDF+Yu/EmAWZWTfV8wEQnnJ8Slu9Jcc
 pbsWGb6IwFAIsNSEMMw==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=69789f94 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=_49z0RMimKR0Jg0_r6oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: 3eh_6FuRnLVwC4GNVd2DAWeOHavXnrTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270092
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

On Tue, Jan 27, 2026 at 04:13:58PM +0530, Vignesh Raman wrote:
> The sm8350-hdk jobs are short and each test takes around 2–3 minutes and
> the full job completes in about 10 minutes. Running 4 parallel jobs uses
> 4 devices at once, which is not needed. Set parallel to 2 to reduce
> device usage.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
