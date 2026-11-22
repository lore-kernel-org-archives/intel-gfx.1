Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC03606A33A
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xO7M/l50
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A30B10EF23;
	Mon, 23 Nov 2026 15:17:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF6110E5FF
 for <intel-gfx@lists.freedesktop.org>; Sun, 22 Nov 2026 16:59:58 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so24003615e9.2
 for <intel-gfx@lists.freedesktop.org>; Sun, 22 Nov 2026 08:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795366797; x=1795971597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0mnruJCi4gXWgtrWNMhLBNdhM+30e2MaNeSeot4jHHo=;
 b=xO7M/l50vsdt7Nu8jpGrXkAVrmKWF/iGMF3Aa4BoU1FeCFmxybAM33Xto0uA3FrRxE
 vqe+U9GdAgg15r+DXz3A1RiHaj52+W3lGEkDNq2oTbDIO2feV4KjRcOwNnB9mKZhH6hx
 hBFYUKhjZWKjaxNHb9Qevnsooyzn0Weu1YPTvC7k+RpI6XmR5gzyntuojnVqmV9o2lp1
 K5kINAgGMVuOaD6mUcbI8xNsOPy7CBQl+98WZ/2kVOSkamZGsCfix+yyGX3XgWSRnWyO
 7ZFc3Mhz2Wcvb8mbCt3bx0207pYESq0XrhkbBsjYVguo6xT10OvW9t+P0snM1oR97vcJ
 Hfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795366797; x=1795971597;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0mnruJCi4gXWgtrWNMhLBNdhM+30e2MaNeSeot4jHHo=;
 b=ASoRD3e5RukJfQiGF4jAS4AawQRpU9TGp65XgE2GNHf5thAXo0p4GxMOI2ksgBwJVR
 ZXvvrwLgj6EqrOEsiHYeYduVmdN3iPxpFbcdz/o6/jvcIt7IyTeS3msPeBeP3IqJ1p3a
 3OhchgQuK0ZFmick8Rremg0IGt83IGgnVzBgDGA2jZUi8MGBdFeKolrPARH6cubALojZ
 91Z1faaV607GUsXhI2jlxyTI8j13y4w58NMyNMQXAcIoSmACUXBfr52uV+LnjZ0A1J+/
 YVym8WItcPVzfUpabvsH9sUfBhQXZO3+pQckBFgAHpsOeapQQDnJfQi9N93xwnaXX8+H
 f7eA==
X-Forwarded-Encrypted: i=1;
 AL+hErGtO6uY3Z7MBNxzuLig/jHZ2CL3s5PWwiSbhQWmtY+7q7g64yXvPtJgQ5OwPj0Anu1xOC5raLD4yEo=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/IAx8hESQJYA4rAo67B8XqhNMloeM6OuzIbzrrV8aE8P/qiTPF
 bEF93TApiDbzRn2eIKhQgM7OZd3ZLlRZjOh6K5FKTfFnncJUD8dO/bJK
X-Gm-Gg: AZFdTZc2BVrIQzG6daWnRhmDzgrFovh3adlCrHaU1BDgbJcgQZ5Ioa8MMRsAY9WAt7C
 z5ttZzJHa6grMiZ0UQrD6EwgqELKejr5IJg7SyjYTwkuqAaQIw5Fq5aXmoU81t/sKv6i8PeHiN4
 RoK8THZq5GZuxfECeVUIa+PNS2yQs6zS+wljm75iUB4pJQjFjueD7f0XvxzNDmnBd+WgFVFGCb4
 j3GnvzDY7mj7M2vxmIL5T8IXwYx2cWabOBS4K7hTsnP8Tn2lALz9ebkBw7cwodFtFmESVWYI6fX
 NYEuSoPsj1CT1dV4eQNrNeKOAU3mfMdkFCx4UzuK/VeNQGJGPAIYadM1Te1toEjWvtOk+wxbgRw
 JWgvDUHUOTH0P6mg828mpHqm3/0OQDYb+XEf7nJXr8IPE0QjClKFmMZhlFDbFx4kkrdCRmPdR93
 R2RgCuEO8x/qf/9JW/9tPW3vL42Wp2lwA2PX7pXTD8/vMsiV3uA/xfix9y77Mouc7DIc3ocM84k
 YkR5wbimrxpyVt1RyThBhSnrtKZUj48PbFS4KZTVUIx4YR0IcAyNRay+midYhp7+aIiFk8ZktLL
 eOgc0b55Y3K2dmZt4jg99bM22kKDb7MoNze1P3U30k1QJ/EwCadYdiCti20C9x3XY92VnmPlD48
 gty+BvDGxFNlTt3lgSsfaSA==
X-Received: by 2002:a05:600c:154c:b0:4a2:1364:252a with SMTP id
 5b1f17b1804b1-4bb887c28a8mr197658875e9.3.1795366796946; 
 Sun, 22 Nov 2026 08:59:56 -0800 (PST)
Received: from [192.168.10.197]
 (cpc92320-cmbg19-2-0-cust1861.5-4.cable.virginm.net. [82.13.71.70])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c61f558sm17541739f8f.58.2026.11.22.08.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2026 08:59:56 -0800 (PST)
Message-ID: <519cee89-1315-4edb-90cd-fa99e6eabf77@gmail.com>
Date: Sun, 22 Nov 2026 16:59:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Testing: [PATCH v4 4/4] drm/i915/dp: Always write the HDR content
 luminance
To: Yitian Shao <fighters390@qq.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, sebastian.wick@redhat.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com
References: <20261121013532.21135-1-fighters390@qq.com>
 <tencent_4B4D5022969E4FEF24BDDD2C4993D2D39709@qq.com>
From: Daniel Green <danielgreenhome@gmail.com>
Content-Language: en-US
In-Reply-To: <tencent_4B4D5022969E4FEF24BDDD2C4993D2D39709@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:58 +0000
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested-by: Daniel Green <danielgreenhome@gmail.com>

I've tested the above set of 4 patches locally on an Asus Zenbook ux535, 
I can confirm that these correctly enable HDR on my internal monitor.

On 21/11/2026 01:35, Yitian Shao wrote:
> intel_dp_aux_write_content_luminance() skips the DPCD write when the
> encoder cannot send a gamut metadata SDP. That is backwards: the DPCD
> register is what the AUX HDR interface uses on those platforms.
>
> Drop the check instead of inverting it. INTEL_EDP_HDR_TCON_SDP_OVERRIDE_AUX
> already tells the TCON whether to use the SDP or the DPCD value, so the
> write is harmless where the SDP takes precedence.
>
> Signed-off-by: Yitian Shao <fighters390@qq.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 8c7fd99..6b33ba0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -250,9 +250,6 @@ intel_dp_aux_write_content_luminance(struct intel_connector *connector,
>   	int ret;
>   	u8 buf[4];
>   
> -	if (!intel_dp_has_gamut_metadata_dip(connector->encoder))
> -		return;
> -
>   	buf[0] = hdr_metadata->hdmi_metadata_type1.max_cll & 0xFF;
>   	buf[1] = (hdr_metadata->hdmi_metadata_type1.max_cll & 0xFF00) >> 8;
>   	buf[2] = hdr_metadata->hdmi_metadata_type1.max_fall & 0xFF;
