Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75BE606A327
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOpIkJFk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FL5zutK+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8457510E829;
	Fri, 13 Nov 2026 14:28:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55410E4CA
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 03:22:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AC2ZWj82514130
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 03:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nia/3Fejzq/8pwGFpOYXDtAfbAIiNtIbDIVtuujz/Q0=; b=LOpIkJFk1qcw9dNR
 IGn4sA5UCOtmAyOLiqsLJomBSihf4tRG/wVsCktehqAKlkuNZgtYphQhJjW6Y110
 kTG5YWTTru2Y4kr1/8Qaz2fJNsQUA5m5Ka/oMwTdFZcaTTHwgtDbyWShJX3YM2kD
 EmjFp/er0dKt0SxCLGtWua47LlVvaLI2blykILXXkO3UwS+VXzUWZRxAMyr0kUAL
 D2ZraxIHHVBA5T54djHiEvNFaJ4a29MejhkgHnvgHbDKd2hHf1ktkpCFc9c1JW8w
 HlSYTbk1ggYxW2ytlV2rCexQSaEEvjbUKJ7IAbCnqhsZMIW4j1I8fuadDWk7094Z
 MUoEtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1spfw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Nov 2026 03:22:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2eb5375cd68so34538535ad.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 19:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794453751; x=1795058551;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Nia/3Fejzq/8pwGFpOYXDtAfbAIiNtIbDIVtuujz/Q0=;
 b=FL5zutK+7CDqgKu8493RnAoEosak9AhhFWguK02YDIOGDF3RxsvYRMJFY9fHat7y/P
 wopEXdxfs8H++yaNxNYNddNLHwS0u1As0yJJIqXSZsHrgMWE2KasqYqezGlQ1SDnDTeZ
 1k/kSsk2yqgbgCzL3DoTXc/yZFXgL407JRbro9FnjAi6Vn/vu8K5CAIz/5E/q5U6mRU4
 EsPz9ZBbHcGrf280ixKPLj2gCesPIfsYJylOZ8etHaSk4fObN3OJMLKPp0vwyr6yTlVP
 iMktn6q+ZTs9m2JLn0iCeZ3Ius0mTWpGGcI/IHMs8nNE5o1mulruO9inwuZFudIuDE/0
 0tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794453751; x=1795058551;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Nia/3Fejzq/8pwGFpOYXDtAfbAIiNtIbDIVtuujz/Q0=;
 b=F8FwyxJTBpHAmNrDzda0RkeJpFVnT07eGPGGe0svPG8MGivQPQNTJnqcjqBKqCwqA2
 HmXl8m2sof4AH4U5dXzF944VYw0anaCLhXuDOITfRCZ30f3XKqbff/qEzFAkm5/vgiMp
 /3tP/D9D6s/8FWaYUGtQoi31HZKKjjXpCSBOx6sXddkI1LwFpgt0M+Qbi23agTIj23EI
 AqzIXTos1dnL6nsNyM0R7Cwy8zrGmzo0uieBVkZrSUHvKUfMElyHPcLCyIP165tRALxi
 Got+Azs9R48HOjmVCMEizfiGbvxVuWW2hOWM48F4Oyv4/EDK63tjhLdCNQW0376RQd5p
 mEAg==
X-Forwarded-Encrypted: i=1;
 AL+hErHzCnGSNe43xoWaXiGoGf14zmThN8KSGKcGbBWPGtNU+32C1rxH77KtpEbeWnYDpPcVdui8ApCNmSY=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+zE7K+I5T2uJVuY458aD2u126dDtAW5pKAjI+XeRW+G9iUpte5
 xDHivOcGkSDNBzSUnAF78TlwKcY0E5nTnTXRm0l2Vg0WVH5nzkK9m1RQk6bF5xdoly4jCAWu1NX
 pdO86G/CxDl8U5ce29Iaw13INabGKfu4mLSOT4ooFlZzzbYISmbnX4XRdVxO2kgxeGRwPxh8=
X-Gm-Gg: AYBFou3rhUc3Wz5pqT9ilrIrTrDaHHba2jZ7xz5fmC6n8XqVUbZ/B8R5wU6OhSTvfRa
 eAvvqOJtwOgyLKcwHz/E4WkaWqi/yi9J830cRCWSiGnciM7lrZICB8GwX/oXr/buvCXH0Hlz2Ty
 sWKJAhU1aKF95euBQRhaIxy/W2nRPjEDYQAtlaqhjxHCrtUXboEHtwBE8fqSi7rWnzXE3o+fl9F
 5ZqzcpO/23/UtaYHWGnzh4CldBlr0DWAC9zKkeIq840hFoc87YtSaARbRufRnpWSqUik2Z1pTuE
 q7LtDzyUUM4Od9F3Y7t3ShTFjcwP+2cpumJB3IjrtfDOTQC22MV8iRs3s4I7rM8zNeFYLtwqEui
 M8Lv8FHLhUySmTWtqb+mCAAOTYukLN7m5FTXPnbu/BlXpiexfIZRaXEC66+Jf9EX61sChECp9tU
 yLod3os6ZybdjsS+vMrd6/k/WC8xf3dMKIrnATxqVfUMX4sg==
X-Received: by 2002:a17:903:2ad0:b0:2e9:58c5:8c68 with SMTP id
 d9443c01a7336-2edd7acfcd0mr38209065ad.54.1794453750553; 
 Wed, 11 Nov 2026 19:22:30 -0800 (PST)
X-Received: by 2002:a17:903:2ad0:b0:2e9:58c5:8c68 with SMTP id
 d9443c01a7336-2edd7acfcd0mr38208695ad.54.1794453750048; 
 Wed, 11 Nov 2026 19:22:30 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2edb6dfb58dsm26134275ad.66.2026.11.11.19.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 19:22:29 -0800 (PST)
Message-ID: <acd476e0-fb24-4f11-b917-c4e86f86171a@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:22:16 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] cpufreq: ondemand: Include <asm/cpu_device_id.h>
 unconditionally
To: Pavel Popov <pavel.e.popov@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Arnd Bergmann <arnd@arndb.de>,
 Len Brown <lenb@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "David S . Miller" <davem@davemloft.net>, x86@kernel.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261111234821.4814-1-pavel.e.popov@intel.com>
 <20261111234821.4814-5-pavel.e.popov@intel.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261111234821.4814-5-pavel.e.popov@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af530f7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=L27Nr_72VT4YvYD4_PkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: sPgXKxy9pAoOTr01c8AxKCubOlSgqOt6
X-Proofpoint-ORIG-GUID: sPgXKxy9pAoOTr01c8AxKCubOlSgqOt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMyBTYWx0ZWRfX3dvDVzr05uH8
 Lm+iVl26jGa8rI0YIB92aQ9Ux056uUoGqi8A+xUYhB5rosWFt56Cq95gwIj2CnGW3eBkiV4zrHi
 Z+ZOmJXTmcjAtNngMqUbmRseB8w4zF01kvnc2Qb5+AZRgRCfGfuf+x9P6zwYBlzTYN7DKZbuF1D
 0JD1F1NimjrUVn5+t2F5xZeSy3+BxQm6ZYG9jA09z+ZtIa2BqcGZa/vXov+lp+lrS1KgPzuIwhs
 w/lpde3eWYR5AZOjSKO7AzeW2VFe26bTDhMWxVdHf9CHTNPf+DvPk7iNmU/+39FrhUU4V7vtQE0
 zJJiMHj7+yQFg5lACqdi9mpQuSmqO4Mt6nzYoUqaJ/hVP3u9yTNtxvpwrJird1N4r4Z2LFRshx7
 hT9HSdjtEu6v8V2QXUzPd/nWNG7uMLNZA8+1NHce4r3bPRz+8S1jmXBYtchh4y6W8bxiLuf0t2o
 37ucK2+nFfzTphrU3pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMyBTYWx0ZWRfX44/Nndu+qPLq
 1xz4X82f8h24BPfMWpi+mzPi4G5g4Ehz3xgQuRE4HoBbH6FWSChoJX3Lwu1BaPSeWhL6br04aNL
 PV7Fgf9mSN7PdbqjbQYuPn2u1bouZNQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120013
X-Mailman-Approved-At: Fri, 13 Nov 2026 14:28:12 +0000
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

On 11/12/2026 7:48 AM, Pavel Popov wrote:
> <asm/cpu_device_id.h> now has a generic version, so the #ifdef
> CONFIG_X86 around the include is no longer needed.
> 
> od_should_io_be_busy() still needs CONFIG_X86 for boot_cpu_data.
> 
> Signed-off-by: Pavel Popov <pavel.e.popov@intel.com>
> ---
> Depends on <asm-generic/cpu_device_id.h> from [1]; please apply after
> it is in mainline.


Yeah, this patch strictly depends on [1] (series patch 1/3) being in
mainline first; otherwise non-x86 builds break.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> 
> [1] https://lore.kernel.org/r/20261111234439.4098-1-pavel.e.popov@intel.com
> 
>   drivers/cpufreq/cpufreq_ondemand.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_ondemand.h b/drivers/cpufreq/cpufreq_ondemand.h
> index 2ca8f1aaf2e..0e33865f9d3 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.h
> +++ b/drivers/cpufreq/cpufreq_ondemand.h
> @@ -6,6 +6,8 @@
>    * Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>    */
>   
> +#include <asm/cpu_device_id.h>
> +
>   #include "cpufreq_governor.h"
>   
>   struct od_policy_dbs_info {
> @@ -26,8 +28,6 @@ struct od_dbs_tuners {
>   };
>   
>   #ifdef CONFIG_X86
> -#include <asm/cpu_device_id.h>
> -
>   /*
>    * Not all CPUs want IO time to be accounted as busy; this depends on
>    * how efficient idling at a higher frequency/voltage is.


-- 
Thx and BRs,
Zhongqiu Han
